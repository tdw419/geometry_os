; DESCRIPTION: Places a black line segment connecting (244, 223) to (284, 253).
; PLAN: r0=244(x1), r1=223(y1), r2=284(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 223
LDI r2, 284
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
