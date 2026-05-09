; DESCRIPTION: Places a red line segment connecting (4, 209) to (253, 239).
; PLAN: r0=4(x1), r1=209(y1), r2=253(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 209
LDI r2, 253
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
