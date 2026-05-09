; DESCRIPTION: Draws a cyan line from (213, 22) to (185, 72).
; PLAN: r0=213(x1), r1=22(y1), r2=185(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 22
LDI r2, 185
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
