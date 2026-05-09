; DESCRIPTION: Places a cyan line segment connecting (114, 139) to (91, 221).
; PLAN: r0=114(x1), r1=139(y1), r2=91(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 139
LDI r2, 91
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
