; DESCRIPTION: Draws a white line from (475, 222) to (293, 192).
; PLAN: r0=475(x1), r1=222(y1), r2=293(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 222
LDI r2, 293
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
