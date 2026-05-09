; DESCRIPTION: Draws a red line from (286, 152) to (152, 248).
; PLAN: r0=286(x1), r1=152(y1), r2=152(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 152
LDI r2, 152
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
