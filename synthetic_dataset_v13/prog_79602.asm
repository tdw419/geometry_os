; DESCRIPTION: Renders a yellow box of size 63x70 starting at (432, 14).
; PLAN: r0=432(x), r1=14(y), r2=63(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 14
LDI r2, 63
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
