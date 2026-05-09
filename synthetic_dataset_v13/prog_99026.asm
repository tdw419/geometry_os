; DESCRIPTION: Places a black line segment connecting (418, 98) to (263, 174).
; PLAN: r0=418(x1), r1=98(y1), r2=263(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 98
LDI r2, 263
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
