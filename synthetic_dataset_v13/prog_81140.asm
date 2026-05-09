; DESCRIPTION: Draws a red line from (430, 95) to (470, 236).
; PLAN: r0=430(x1), r1=95(y1), r2=470(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 95
LDI r2, 470
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
