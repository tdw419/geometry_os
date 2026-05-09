; DESCRIPTION: Draws a red line from (110, 162) to (410, 195).
; PLAN: r0=110(x1), r1=162(y1), r2=410(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 162
LDI r2, 410
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
