; DESCRIPTION: Renders a green box of size 28x46 starting at (56, 142).
; PLAN: r0=56(x), r1=142(y), r2=28(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 142
LDI r2, 28
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
