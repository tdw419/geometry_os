; DESCRIPTION: Renders a green box of size 70x12 starting at (195, 20).
; PLAN: r0=195(x), r1=20(y), r2=70(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 20
LDI r2, 70
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
