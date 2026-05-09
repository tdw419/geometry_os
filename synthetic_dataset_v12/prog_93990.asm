; DESCRIPTION: Places a green line segment connecting (207, 248) to (226, 186).
; PLAN: r0=207(x1), r1=248(y1), r2=226(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 248
LDI r2, 226
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
