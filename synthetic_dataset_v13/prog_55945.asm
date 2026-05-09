; DESCRIPTION: Places a black line segment connecting (499, 165) to (464, 206).
; PLAN: r0=499(x1), r1=165(y1), r2=464(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 165
LDI r2, 464
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
