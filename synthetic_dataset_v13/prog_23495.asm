; DESCRIPTION: Places a green line segment connecting (277, 65) to (480, 169).
; PLAN: r0=277(x1), r1=65(y1), r2=480(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 65
LDI r2, 480
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
