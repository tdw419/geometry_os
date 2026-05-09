; DESCRIPTION: Renders a white line between points (286, 129) and (387, 237).
; PLAN: r0=286(x1), r1=129(y1), r2=387(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 129
LDI r2, 387
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
