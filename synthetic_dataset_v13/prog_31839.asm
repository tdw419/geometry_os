; DESCRIPTION: Places a red line segment connecting (409, 214) to (347, 228).
; PLAN: r0=409(x1), r1=214(y1), r2=347(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 214
LDI r2, 347
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
