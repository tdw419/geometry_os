; DESCRIPTION: Draws a cyan line from (147, 248) to (420, 254).
; PLAN: r0=147(x1), r1=248(y1), r2=420(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 248
LDI r2, 420
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
