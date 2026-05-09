; DESCRIPTION: Draws a white line from (103, 22) to (271, 154).
; PLAN: r0=103(x1), r1=22(y1), r2=271(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 22
LDI r2, 271
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
