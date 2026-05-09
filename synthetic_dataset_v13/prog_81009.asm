; DESCRIPTION: Draws a cyan line from (270, 113) to (283, 248).
; PLAN: r0=270(x1), r1=113(y1), r2=283(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 113
LDI r2, 283
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
