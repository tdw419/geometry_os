; DESCRIPTION: Places a green line segment connecting (37, 115) to (304, 154).
; PLAN: r0=37(x1), r1=115(y1), r2=304(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 115
LDI r2, 304
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
