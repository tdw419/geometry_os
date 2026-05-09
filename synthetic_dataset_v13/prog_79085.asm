; DESCRIPTION: Draws a red line from (31, 213) to (180, 47).
; PLAN: r0=31(x1), r1=213(y1), r2=180(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 213
LDI r2, 180
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
