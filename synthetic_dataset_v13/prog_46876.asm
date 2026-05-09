; DESCRIPTION: Draws a white line from (113, 129) to (170, 51).
; PLAN: r0=113(x1), r1=129(y1), r2=170(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 129
LDI r2, 170
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
