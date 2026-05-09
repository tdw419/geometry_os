; DESCRIPTION: Renders a white line between points (246, 9) and (346, 26).
; PLAN: r0=246(x1), r1=9(y1), r2=346(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 9
LDI r2, 346
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
