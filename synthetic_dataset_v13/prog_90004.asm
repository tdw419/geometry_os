; DESCRIPTION: Draws a red line from (414, 209) to (246, 152).
; PLAN: r0=414(x1), r1=209(y1), r2=246(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 209
LDI r2, 246
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
