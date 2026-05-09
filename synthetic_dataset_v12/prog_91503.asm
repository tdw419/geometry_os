; DESCRIPTION: Renders a white line between points (324, 83) and (242, 180).
; PLAN: r0=324(x1), r1=83(y1), r2=242(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 83
LDI r2, 242
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
