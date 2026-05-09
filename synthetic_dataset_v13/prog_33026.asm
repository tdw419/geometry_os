; DESCRIPTION: Places a cyan line segment connecting (132, 188) to (207, 148).
; PLAN: r0=132(x1), r1=188(y1), r2=207(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 188
LDI r2, 207
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
