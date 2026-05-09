; DESCRIPTION: Draws a cyan line from (289, 165) to (13, 52).
; PLAN: r0=289(x1), r1=165(y1), r2=13(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 165
LDI r2, 13
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
