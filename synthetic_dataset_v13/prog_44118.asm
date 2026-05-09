; DESCRIPTION: Draws a cyan line from (488, 216) to (432, 70).
; PLAN: r0=488(x1), r1=216(y1), r2=432(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 216
LDI r2, 432
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
