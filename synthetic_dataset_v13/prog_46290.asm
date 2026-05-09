; DESCRIPTION: Draws a cyan line from (299, 106) to (20, 141).
; PLAN: r0=299(x1), r1=106(y1), r2=20(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 106
LDI r2, 20
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
