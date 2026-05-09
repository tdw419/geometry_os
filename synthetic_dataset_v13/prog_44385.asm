; DESCRIPTION: Draws a cyan line from (204, 204) to (400, 54).
; PLAN: r0=204(x1), r1=204(y1), r2=400(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 204
LDI r2, 400
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
