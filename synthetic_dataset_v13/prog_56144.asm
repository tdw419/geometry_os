; DESCRIPTION: Renders a white line between points (340, 47) and (425, 73).
; PLAN: r0=340(x1), r1=47(y1), r2=425(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 47
LDI r2, 425
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
