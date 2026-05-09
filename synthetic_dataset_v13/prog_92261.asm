; DESCRIPTION: Renders a white line between points (131, 146) and (52, 107).
; PLAN: r0=131(x1), r1=146(y1), r2=52(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 146
LDI r2, 52
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
