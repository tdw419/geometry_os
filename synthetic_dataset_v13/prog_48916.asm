; DESCRIPTION: Renders a white line between points (240, 234) and (360, 70).
; PLAN: r0=240(x1), r1=234(y1), r2=360(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 234
LDI r2, 360
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
