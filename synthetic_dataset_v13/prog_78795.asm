; DESCRIPTION: Renders a white line between points (408, 186) and (382, 95).
; PLAN: r0=408(x1), r1=186(y1), r2=382(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 186
LDI r2, 382
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
