; DESCRIPTION: Draws a red line from (468, 236) to (213, 91).
; PLAN: r0=468(x1), r1=236(y1), r2=213(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 236
LDI r2, 213
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
