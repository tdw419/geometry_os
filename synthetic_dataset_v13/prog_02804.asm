; DESCRIPTION: Renders a white line between points (286, 197) and (105, 64).
; PLAN: r0=286(x1), r1=197(y1), r2=105(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 197
LDI r2, 105
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
