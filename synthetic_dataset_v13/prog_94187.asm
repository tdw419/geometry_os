; DESCRIPTION: Draws a cyan line from (480, 151) to (478, 94).
; PLAN: r0=480(x1), r1=151(y1), r2=478(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 151
LDI r2, 478
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
