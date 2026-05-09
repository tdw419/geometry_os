; DESCRIPTION: Renders a white line between points (19, 164) and (70, 32).
; PLAN: r0=19(x1), r1=164(y1), r2=70(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 164
LDI r2, 70
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
