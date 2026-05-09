; DESCRIPTION: Places a cyan line segment connecting (0, 186) to (333, 31).
; PLAN: r0=0(x1), r1=186(y1), r2=333(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 186
LDI r2, 333
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
