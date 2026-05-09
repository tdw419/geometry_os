; DESCRIPTION: Draws a cyan line from (488, 53) to (64, 230).
; PLAN: r0=488(x1), r1=53(y1), r2=64(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 53
LDI r2, 64
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
