; DESCRIPTION: Renders a yellow box of size 104x46 starting at (323, 172).
; PLAN: r0=323(x), r1=172(y), r2=104(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 172
LDI r2, 104
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
