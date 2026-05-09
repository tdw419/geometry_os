; DESCRIPTION: Places a green line segment connecting (255, 166) to (248, 90).
; PLAN: r0=255(x1), r1=166(y1), r2=248(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 166
LDI r2, 248
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
