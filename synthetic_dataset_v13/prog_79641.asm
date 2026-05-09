; DESCRIPTION: Renders a white line between points (408, 91) and (317, 107).
; PLAN: r0=408(x1), r1=91(y1), r2=317(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 91
LDI r2, 317
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
