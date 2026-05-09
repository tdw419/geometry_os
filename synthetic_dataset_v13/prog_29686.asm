; DESCRIPTION: Renders a white line between points (18, 134) and (209, 196).
; PLAN: r0=18(x1), r1=134(y1), r2=209(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 134
LDI r2, 209
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
