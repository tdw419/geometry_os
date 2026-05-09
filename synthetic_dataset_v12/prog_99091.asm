; DESCRIPTION: Renders a white line between points (407, 80) and (48, 242).
; PLAN: r0=407(x1), r1=80(y1), r2=48(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 80
LDI r2, 48
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
