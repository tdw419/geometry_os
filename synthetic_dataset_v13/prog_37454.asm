; DESCRIPTION: Renders a white line between points (162, 129) and (354, 162).
; PLAN: r0=162(x1), r1=129(y1), r2=354(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 129
LDI r2, 354
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
