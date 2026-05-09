; DESCRIPTION: Draws a yellow line from (393, 83) to (434, 70).
; PLAN: r0=393(x1), r1=83(y1), r2=434(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 83
LDI r2, 434
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
