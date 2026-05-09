; DESCRIPTION: Places a green line segment connecting (139, 146) to (67, 221).
; PLAN: r0=139(x1), r1=146(y1), r2=67(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 146
LDI r2, 67
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
