; DESCRIPTION: Draws a green line from (288, 189) to (255, 148).
; PLAN: r0=288(x1), r1=189(y1), r2=255(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 189
LDI r2, 255
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
