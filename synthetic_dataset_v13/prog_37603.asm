; DESCRIPTION: Renders a orange line between points (412, 228) and (296, 178).
; PLAN: r0=412(x1), r1=228(y1), r2=296(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 228
LDI r2, 296
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
