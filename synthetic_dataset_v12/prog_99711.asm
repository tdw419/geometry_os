; DESCRIPTION: Draws a red line from (278, 179) to (126, 209).
; PLAN: r0=278(x1), r1=179(y1), r2=126(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 179
LDI r2, 126
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
