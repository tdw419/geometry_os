; DESCRIPTION: Places a green line segment connecting (171, 124) to (319, 66).
; PLAN: r0=171(x1), r1=124(y1), r2=319(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 124
LDI r2, 319
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
