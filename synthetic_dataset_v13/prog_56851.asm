; DESCRIPTION: Renders a white line between points (256, 240) and (21, 250).
; PLAN: r0=256(x1), r1=240(y1), r2=21(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 240
LDI r2, 21
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
