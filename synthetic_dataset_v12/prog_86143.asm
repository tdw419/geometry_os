; DESCRIPTION: Places a green line segment connecting (220, 206) to (290, 71).
; PLAN: r0=220(x1), r1=206(y1), r2=290(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 206
LDI r2, 290
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
