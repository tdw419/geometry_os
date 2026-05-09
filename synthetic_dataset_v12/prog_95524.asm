; DESCRIPTION: Places a yellow line segment connecting (277, 255) to (480, 54).
; PLAN: r0=277(x1), r1=255(y1), r2=480(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 255
LDI r2, 480
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
