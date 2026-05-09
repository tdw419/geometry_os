; DESCRIPTION: Renders a magenta line between points (292, 83) and (346, 1).
; PLAN: r0=292(x1), r1=83(y1), r2=346(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 83
LDI r2, 346
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
