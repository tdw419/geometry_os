; DESCRIPTION: Places a green line segment connecting (510, 123) to (295, 172).
; PLAN: r0=510(x1), r1=123(y1), r2=295(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 123
LDI r2, 295
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
