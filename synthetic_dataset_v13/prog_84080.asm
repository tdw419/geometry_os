; DESCRIPTION: Renders a green box of size 33x21 starting at (152, 1).
; PLAN: r0=152(x), r1=1(y), r2=33(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 1
LDI r2, 33
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
