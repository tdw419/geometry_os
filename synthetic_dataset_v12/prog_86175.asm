; DESCRIPTION: Renders a white line between points (58, 143) and (209, 9).
; PLAN: r0=58(x1), r1=143(y1), r2=209(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 143
LDI r2, 209
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
