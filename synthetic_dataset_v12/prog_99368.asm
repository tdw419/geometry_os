; DESCRIPTION: Renders a white line between points (239, 80) and (2, 165).
; PLAN: r0=239(x1), r1=80(y1), r2=2(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 80
LDI r2, 2
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
