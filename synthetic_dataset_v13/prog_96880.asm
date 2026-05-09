; DESCRIPTION: Places a green line segment connecting (425, 117) to (94, 113).
; PLAN: r0=425(x1), r1=117(y1), r2=94(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 117
LDI r2, 94
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
