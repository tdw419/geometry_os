; DESCRIPTION: Draws a black line from (488, 177) to (21, 215).
; PLAN: r0=488(x1), r1=177(y1), r2=21(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 177
LDI r2, 21
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
