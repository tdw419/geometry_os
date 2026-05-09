; DESCRIPTION: Renders a white line between points (365, 246) and (488, 76).
; PLAN: r0=365(x1), r1=246(y1), r2=488(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 246
LDI r2, 488
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
