; DESCRIPTION: Draws a red line from (263, 240) to (23, 206).
; PLAN: r0=263(x1), r1=240(y1), r2=23(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 240
LDI r2, 23
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
