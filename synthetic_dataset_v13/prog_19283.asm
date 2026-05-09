; DESCRIPTION: Renders a white line between points (334, 59) and (209, 196).
; PLAN: r0=334(x1), r1=59(y1), r2=209(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 59
LDI r2, 209
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
