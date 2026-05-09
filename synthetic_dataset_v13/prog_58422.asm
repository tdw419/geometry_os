; DESCRIPTION: Places a green line segment connecting (255, 174) to (350, 51).
; PLAN: r0=255(x1), r1=174(y1), r2=350(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 174
LDI r2, 350
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
