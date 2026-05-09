; DESCRIPTION: Draws a cyan line from (319, 63) to (288, 248).
; PLAN: r0=319(x1), r1=63(y1), r2=288(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 63
LDI r2, 288
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
