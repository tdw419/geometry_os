; DESCRIPTION: Renders a white line between points (156, 69) and (405, 47).
; PLAN: r0=156(x1), r1=69(y1), r2=405(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 69
LDI r2, 405
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
