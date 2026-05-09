; DESCRIPTION: Renders a white line between points (459, 59) and (190, 27).
; PLAN: r0=459(x1), r1=59(y1), r2=190(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 59
LDI r2, 190
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
