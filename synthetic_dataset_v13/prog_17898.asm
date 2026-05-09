; DESCRIPTION: Renders a yellow box of size 77x21 starting at (152, 133).
; PLAN: r0=152(x), r1=133(y), r2=77(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 133
LDI r2, 77
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
