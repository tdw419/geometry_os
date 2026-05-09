; DESCRIPTION: Draws a cyan line from (310, 186) to (396, 241).
; PLAN: r0=310(x1), r1=186(y1), r2=396(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 186
LDI r2, 396
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
