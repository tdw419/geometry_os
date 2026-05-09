; DESCRIPTION: Draws a cyan line from (17, 127) to (274, 73).
; PLAN: r0=17(x1), r1=127(y1), r2=274(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 127
LDI r2, 274
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
