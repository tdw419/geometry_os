; DESCRIPTION: Places a green line segment connecting (138, 236) to (494, 127).
; PLAN: r0=138(x1), r1=236(y1), r2=494(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 236
LDI r2, 494
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
