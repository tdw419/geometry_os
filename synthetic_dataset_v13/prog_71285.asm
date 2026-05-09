; DESCRIPTION: Renders a green line between points (70, 29) and (436, 108).
; PLAN: r0=70(x1), r1=29(y1), r2=436(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 29
LDI r2, 436
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
