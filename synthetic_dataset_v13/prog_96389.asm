; DESCRIPTION: Draws a orange line from (103, 204) to (206, 208).
; PLAN: r0=103(x1), r1=204(y1), r2=206(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 204
LDI r2, 206
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
