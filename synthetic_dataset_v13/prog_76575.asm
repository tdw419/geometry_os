; DESCRIPTION: Draws a cyan line from (245, 141) to (292, 17).
; PLAN: r0=245(x1), r1=141(y1), r2=292(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 141
LDI r2, 292
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
