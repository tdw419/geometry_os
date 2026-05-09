; DESCRIPTION: Draws a cyan line from (0, 251) to (317, 141).
; PLAN: r0=0(x1), r1=251(y1), r2=317(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 251
LDI r2, 317
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
