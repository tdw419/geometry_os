; DESCRIPTION: Places a red line segment connecting (182, 206) to (455, 248).
; PLAN: r0=182(x1), r1=206(y1), r2=455(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 206
LDI r2, 455
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
