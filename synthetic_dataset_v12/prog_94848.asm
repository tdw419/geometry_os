; DESCRIPTION: Renders a green box of size 56x78 starting at (254, 152).
; PLAN: r0=254(x), r1=152(y), r2=56(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 152
LDI r2, 56
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
