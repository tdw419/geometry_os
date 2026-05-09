; DESCRIPTION: Draws a red line from (74, 150) to (380, 192).
; PLAN: r0=74(x1), r1=150(y1), r2=380(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 150
LDI r2, 380
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
