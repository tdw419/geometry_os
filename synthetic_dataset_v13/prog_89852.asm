; DESCRIPTION: Draws a cyan line from (359, 164) to (437, 141).
; PLAN: r0=359(x1), r1=164(y1), r2=437(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 164
LDI r2, 437
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
