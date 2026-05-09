; DESCRIPTION: Places a yellow line segment connecting (373, 59) to (410, 237).
; PLAN: r0=373(x1), r1=59(y1), r2=410(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 59
LDI r2, 410
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
