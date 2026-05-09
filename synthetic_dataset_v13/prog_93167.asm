; DESCRIPTION: Places a green line segment connecting (322, 210) to (290, 255).
; PLAN: r0=322(x1), r1=210(y1), r2=290(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 210
LDI r2, 290
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
