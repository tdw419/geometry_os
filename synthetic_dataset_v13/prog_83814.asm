; DESCRIPTION: Draws a white line from (323, 154) to (178, 148).
; PLAN: r0=323(x1), r1=154(y1), r2=178(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 154
LDI r2, 178
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
