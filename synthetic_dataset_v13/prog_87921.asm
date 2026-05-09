; DESCRIPTION: Draws a red line from (54, 3) to (146, 55).
; PLAN: r0=54(x1), r1=3(y1), r2=146(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 3
LDI r2, 146
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
