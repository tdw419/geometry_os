; DESCRIPTION: Places a green line segment connecting (221, 57) to (336, 213).
; PLAN: r0=221(x1), r1=57(y1), r2=336(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 57
LDI r2, 336
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
