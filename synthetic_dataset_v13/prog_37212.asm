; DESCRIPTION: Draws a red line from (57, 54) to (180, 178).
; PLAN: r0=57(x1), r1=54(y1), r2=180(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 54
LDI r2, 180
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
