; DESCRIPTION: Renders a yellow box of size 54x46 starting at (104, 172).
; PLAN: r0=104(x), r1=172(y), r2=54(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 172
LDI r2, 54
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
