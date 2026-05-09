; DESCRIPTION: Renders a white line between points (30, 59) and (488, 186).
; PLAN: r0=30(x1), r1=59(y1), r2=488(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 59
LDI r2, 488
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
