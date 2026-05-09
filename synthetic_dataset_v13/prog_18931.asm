; DESCRIPTION: Draws a cyan line from (251, 126) to (461, 98).
; PLAN: r0=251(x1), r1=126(y1), r2=461(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 126
LDI r2, 461
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
