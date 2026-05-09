; DESCRIPTION: Renders a green line between points (240, 223) and (313, 98).
; PLAN: r0=240(x1), r1=223(y1), r2=313(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 223
LDI r2, 313
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
