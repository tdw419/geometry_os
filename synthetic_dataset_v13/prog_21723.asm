; DESCRIPTION: Renders a green box of size 28x94 starting at (288, 23).
; PLAN: r0=288(x), r1=23(y), r2=28(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 23
LDI r2, 28
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
