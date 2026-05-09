; DESCRIPTION: Draws a green line from (283, 240) to (186, 154).
; PLAN: r0=283(x1), r1=240(y1), r2=186(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 240
LDI r2, 186
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
