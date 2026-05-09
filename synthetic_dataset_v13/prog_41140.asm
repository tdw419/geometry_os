; DESCRIPTION: Draws a green line from (15, 97) to (303, 154).
; PLAN: r0=15(x1), r1=97(y1), r2=303(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 97
LDI r2, 303
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
