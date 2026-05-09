; DESCRIPTION: Renders a yellow line between points (210, 171) and (69, 26).
; PLAN: r0=210(x1), r1=171(y1), r2=69(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 171
LDI r2, 69
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
