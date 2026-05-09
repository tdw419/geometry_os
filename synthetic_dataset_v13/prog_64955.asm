; DESCRIPTION: Renders a white line between points (327, 247) and (346, 185).
; PLAN: r0=327(x1), r1=247(y1), r2=346(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 247
LDI r2, 346
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
