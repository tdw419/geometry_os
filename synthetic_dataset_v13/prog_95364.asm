; DESCRIPTION: Renders a white line between points (449, 239) and (488, 41).
; PLAN: r0=449(x1), r1=239(y1), r2=488(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 239
LDI r2, 488
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
