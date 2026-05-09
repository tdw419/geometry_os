; DESCRIPTION: Draws a cyan line from (404, 1) to (296, 26).
; PLAN: r0=404(x1), r1=1(y1), r2=296(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 1
LDI r2, 296
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
