; DESCRIPTION: Draws a cyan line from (134, 186) to (372, 248).
; PLAN: r0=134(x1), r1=186(y1), r2=372(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 186
LDI r2, 372
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
