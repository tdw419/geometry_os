; DESCRIPTION: Renders a white line between points (265, 103) and (387, 20).
; PLAN: r0=265(x1), r1=103(y1), r2=387(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 103
LDI r2, 387
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
