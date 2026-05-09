; DESCRIPTION: Renders a white line between points (499, 168) and (475, 179).
; PLAN: r0=499(x1), r1=168(y1), r2=475(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 168
LDI r2, 475
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
