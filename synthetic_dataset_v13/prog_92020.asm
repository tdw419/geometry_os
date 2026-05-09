; DESCRIPTION: Draws a black line from (277, 253) to (495, 68).
; PLAN: r0=277(x1), r1=253(y1), r2=495(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 253
LDI r2, 495
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
