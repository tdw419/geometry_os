; DESCRIPTION: Renders a white line between points (250, 27) and (460, 44).
; PLAN: r0=250(x1), r1=27(y1), r2=460(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 27
LDI r2, 460
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
