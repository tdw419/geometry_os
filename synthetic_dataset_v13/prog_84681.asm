; DESCRIPTION: Draws a cyan line from (335, 250) to (488, 140).
; PLAN: r0=335(x1), r1=250(y1), r2=488(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 250
LDI r2, 488
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
