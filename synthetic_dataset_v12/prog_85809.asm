; DESCRIPTION: Draws a black line from (289, 226) to (488, 117).
; PLAN: r0=289(x1), r1=226(y1), r2=488(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 226
LDI r2, 488
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
