; DESCRIPTION: Draws a green line from (225, 70) to (397, 169).
; PLAN: r0=225(x1), r1=70(y1), r2=397(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 70
LDI r2, 397
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
