; DESCRIPTION: Draws a red line from (66, 57) to (27, 225).
; PLAN: r0=66(x1), r1=57(y1), r2=27(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 57
LDI r2, 27
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
