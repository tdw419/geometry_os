; DESCRIPTION: Renders a yellow box of size 112x16 starting at (110, 152).
; PLAN: r0=110(x), r1=152(y), r2=112(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 152
LDI r2, 112
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
