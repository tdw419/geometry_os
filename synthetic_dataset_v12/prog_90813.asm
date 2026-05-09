; DESCRIPTION: Draws a yellow line from (450, 44) to (255, 70).
; PLAN: r0=450(x1), r1=44(y1), r2=255(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 44
LDI r2, 255
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
