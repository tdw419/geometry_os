; DESCRIPTION: Renders a white line between points (424, 27) and (475, 53).
; PLAN: r0=424(x1), r1=27(y1), r2=475(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 27
LDI r2, 475
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
