; DESCRIPTION: Renders a cyan box of size 12x48 starting at (195, 155).
; PLAN: r0=195(x), r1=155(y), r2=12(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 155
LDI r2, 12
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
