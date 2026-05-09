; DESCRIPTION: Draws a cyan line from (285, 165) to (17, 161).
; PLAN: r0=285(x1), r1=165(y1), r2=17(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 165
LDI r2, 17
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
