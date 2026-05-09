; DESCRIPTION: Draws a cyan line from (254, 254) to (292, 211).
; PLAN: r0=254(x1), r1=254(y1), r2=292(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 254
LDI r2, 292
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
