; DESCRIPTION: Places a cyan line segment connecting (372, 243) to (296, 15).
; PLAN: r0=372(x1), r1=243(y1), r2=296(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 243
LDI r2, 296
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
