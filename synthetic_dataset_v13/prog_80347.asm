; DESCRIPTION: Draws a cyan line from (82, 17) to (325, 62).
; PLAN: r0=82(x1), r1=17(y1), r2=325(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 17
LDI r2, 325
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
