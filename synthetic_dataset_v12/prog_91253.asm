; DESCRIPTION: Renders a blue line between points (44, 69) and (333, 228).
; PLAN: r0=44(x1), r1=69(y1), r2=333(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 69
LDI r2, 333
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
