; DESCRIPTION: Draws a cyan line from (296, 230) to (205, 128).
; PLAN: r0=296(x1), r1=230(y1), r2=205(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 230
LDI r2, 205
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
