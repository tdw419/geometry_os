; DESCRIPTION: Draws a cyan line from (289, 150) to (296, 46).
; PLAN: r0=289(x1), r1=150(y1), r2=296(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 150
LDI r2, 296
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
