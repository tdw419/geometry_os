; DESCRIPTION: Draws a cyan line from (420, 207) to (266, 161).
; PLAN: r0=420(x1), r1=207(y1), r2=266(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 207
LDI r2, 266
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
