; DESCRIPTION: Renders a white line between points (280, 40) and (72, 171).
; PLAN: r0=280(x1), r1=40(y1), r2=72(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 40
LDI r2, 72
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
