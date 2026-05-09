; DESCRIPTION: Renders a cyan box of size 60x94 starting at (209, 48).
; PLAN: r0=209(x), r1=48(y), r2=60(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 48
LDI r2, 60
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
