; DESCRIPTION: Renders a cyan box of size 24x94 starting at (48, 68).
; PLAN: r0=48(x), r1=68(y), r2=24(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 68
LDI r2, 24
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
