; DESCRIPTION: Draws a cyan line from (311, 222) to (126, 145).
; PLAN: r0=311(x1), r1=222(y1), r2=126(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 222
LDI r2, 126
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
