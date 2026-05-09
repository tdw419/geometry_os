; DESCRIPTION: Renders a green line between points (360, 125) and (288, 103).
; PLAN: r0=360(x1), r1=125(y1), r2=288(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 125
LDI r2, 288
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
