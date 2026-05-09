; DESCRIPTION: Draws a red line from (171, 186) to (433, 52).
; PLAN: r0=171(x1), r1=186(y1), r2=433(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 186
LDI r2, 433
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
