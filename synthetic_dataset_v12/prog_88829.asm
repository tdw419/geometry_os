; DESCRIPTION: Renders a white line between points (334, 152) and (39, 27).
; PLAN: r0=334(x1), r1=152(y1), r2=39(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 152
LDI r2, 39
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
