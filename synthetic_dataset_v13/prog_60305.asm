; DESCRIPTION: Places a green line segment connecting (261, 82) to (191, 186).
; PLAN: r0=261(x1), r1=82(y1), r2=191(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 82
LDI r2, 191
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
