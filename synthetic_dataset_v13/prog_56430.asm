; DESCRIPTION: Renders a white line between points (144, 73) and (69, 44).
; PLAN: r0=144(x1), r1=73(y1), r2=69(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 73
LDI r2, 69
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
