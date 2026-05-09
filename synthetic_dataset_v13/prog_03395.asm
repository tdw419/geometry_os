; DESCRIPTION: Draws a red line from (66, 80) to (294, 178).
; PLAN: r0=66(x1), r1=80(y1), r2=294(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 80
LDI r2, 294
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
