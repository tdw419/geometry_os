; DESCRIPTION: Renders a white line between points (480, 165) and (425, 115).
; PLAN: r0=480(x1), r1=165(y1), r2=425(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 165
LDI r2, 425
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
