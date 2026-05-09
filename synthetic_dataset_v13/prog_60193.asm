; DESCRIPTION: Draws a cyan line from (187, 158) to (185, 144).
; PLAN: r0=187(x1), r1=158(y1), r2=185(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 158
LDI r2, 185
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
