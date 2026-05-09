; DESCRIPTION: Renders a green box of size 20x23 starting at (237, 77).
; PLAN: r0=237(x), r1=77(y), r2=20(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 77
LDI r2, 20
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
