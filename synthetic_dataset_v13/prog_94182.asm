; DESCRIPTION: Renders a white line between points (242, 69) and (302, 165).
; PLAN: r0=242(x1), r1=69(y1), r2=302(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 69
LDI r2, 302
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
