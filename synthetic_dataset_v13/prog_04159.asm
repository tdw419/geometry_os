; DESCRIPTION: Places a yellow line segment connecting (262, 252) to (353, 253).
; PLAN: r0=262(x1), r1=252(y1), r2=353(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 252
LDI r2, 353
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
