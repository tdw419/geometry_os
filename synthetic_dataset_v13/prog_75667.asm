; DESCRIPTION: Places a green line segment connecting (480, 102) to (277, 166).
; PLAN: r0=480(x1), r1=102(y1), r2=277(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 102
LDI r2, 277
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
