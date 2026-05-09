; DESCRIPTION: Places a cyan line segment connecting (117, 185) to (32, 148).
; PLAN: r0=117(x1), r1=185(y1), r2=32(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 185
LDI r2, 32
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
