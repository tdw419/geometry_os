; DESCRIPTION: Draws a red line from (406, 215) to (247, 9).
; PLAN: r0=406(x1), r1=215(y1), r2=247(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 215
LDI r2, 247
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
