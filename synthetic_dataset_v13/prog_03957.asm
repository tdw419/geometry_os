; DESCRIPTION: Places a cyan line segment connecting (328, 186) to (164, 58).
; PLAN: r0=328(x1), r1=186(y1), r2=164(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 186
LDI r2, 164
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
