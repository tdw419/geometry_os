; DESCRIPTION: Places a green line segment connecting (213, 13) to (54, 192).
; PLAN: r0=213(x1), r1=13(y1), r2=54(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 13
LDI r2, 54
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
