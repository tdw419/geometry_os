; DESCRIPTION: Draws a orange line from (230, 253) to (433, 120).
; PLAN: r0=230(x1), r1=253(y1), r2=433(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 253
LDI r2, 433
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
