; DESCRIPTION: Places a green line segment connecting (98, 233) to (281, 255).
; PLAN: r0=98(x1), r1=233(y1), r2=281(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 233
LDI r2, 281
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
