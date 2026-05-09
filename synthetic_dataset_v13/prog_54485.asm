; DESCRIPTION: Renders a white line between points (39, 27) and (286, 47).
; PLAN: r0=39(x1), r1=27(y1), r2=286(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 27
LDI r2, 286
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
