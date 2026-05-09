; DESCRIPTION: Places a yellow line segment connecting (346, 236) to (302, 253).
; PLAN: r0=346(x1), r1=236(y1), r2=302(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 236
LDI r2, 302
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
