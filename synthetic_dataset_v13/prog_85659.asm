; DESCRIPTION: Places a red line segment connecting (144, 17) to (346, 0).
; PLAN: r0=144(x1), r1=17(y1), r2=346(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 17
LDI r2, 346
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
