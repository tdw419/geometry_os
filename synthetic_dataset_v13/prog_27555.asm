; DESCRIPTION: Places a purple line segment connecting (217, 55) to (434, 239).
; PLAN: r0=217(x1), r1=55(y1), r2=434(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 55
LDI r2, 434
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
