; DESCRIPTION: Renders a white line between points (292, 28) and (91, 174).
; PLAN: r0=292(x1), r1=28(y1), r2=91(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 28
LDI r2, 91
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
