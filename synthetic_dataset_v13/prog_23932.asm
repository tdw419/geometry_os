; DESCRIPTION: Places a cyan line segment connecting (187, 110) to (412, 186).
; PLAN: r0=187(x1), r1=110(y1), r2=412(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 110
LDI r2, 412
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
