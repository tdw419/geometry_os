; DESCRIPTION: Places a cyan line segment connecting (296, 156) to (107, 21).
; PLAN: r0=296(x1), r1=156(y1), r2=107(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 156
LDI r2, 107
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
