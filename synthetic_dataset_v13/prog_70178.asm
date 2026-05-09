; DESCRIPTION: Draws a red line from (263, 97) to (178, 177).
; PLAN: r0=263(x1), r1=97(y1), r2=178(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 97
LDI r2, 178
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
