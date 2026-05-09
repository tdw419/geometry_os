; DESCRIPTION: Draws a black line from (488, 221) to (304, 78).
; PLAN: r0=488(x1), r1=221(y1), r2=304(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 221
LDI r2, 304
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
