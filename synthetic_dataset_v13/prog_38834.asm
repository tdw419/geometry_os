; DESCRIPTION: Places a cyan line segment connecting (214, 113) to (318, 223).
; PLAN: r0=214(x1), r1=113(y1), r2=318(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 113
LDI r2, 318
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
