; DESCRIPTION: Places a black line segment connecting (126, 222) to (217, 221).
; PLAN: r0=126(x1), r1=222(y1), r2=217(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 222
LDI r2, 217
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
