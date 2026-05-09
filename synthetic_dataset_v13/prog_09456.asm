; DESCRIPTION: Renders a white line between points (75, 242) and (39, 192).
; PLAN: r0=75(x1), r1=242(y1), r2=39(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 242
LDI r2, 39
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
