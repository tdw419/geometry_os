; DESCRIPTION: Places a yellow line segment connecting (315, 240) to (346, 253).
; PLAN: r0=315(x1), r1=240(y1), r2=346(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 240
LDI r2, 346
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
