; DESCRIPTION: Draws a white line from (388, 253) to (0, 154).
; PLAN: r0=388(x1), r1=253(y1), r2=0(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 253
LDI r2, 0
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
