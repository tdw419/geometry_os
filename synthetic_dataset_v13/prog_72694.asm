; DESCRIPTION: Draws a cyan line from (391, 253) to (14, 62).
; PLAN: r0=391(x1), r1=253(y1), r2=14(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 253
LDI r2, 14
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
