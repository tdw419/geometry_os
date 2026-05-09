; DESCRIPTION: Renders a white line between points (488, 79) and (213, 142).
; PLAN: r0=488(x1), r1=79(y1), r2=213(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 79
LDI r2, 213
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
