; DESCRIPTION: Draws a cyan line from (86, 17) to (51, 165).
; PLAN: r0=86(x1), r1=17(y1), r2=51(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 17
LDI r2, 51
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
