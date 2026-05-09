; DESCRIPTION: Places a blue line segment connecting (290, 206) to (252, 166).
; PLAN: r0=290(x1), r1=206(y1), r2=252(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 206
LDI r2, 252
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
