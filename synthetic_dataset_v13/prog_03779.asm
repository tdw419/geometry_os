; DESCRIPTION: Places a green line segment connecting (268, 231) to (388, 166).
; PLAN: r0=268(x1), r1=231(y1), r2=388(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 231
LDI r2, 388
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
