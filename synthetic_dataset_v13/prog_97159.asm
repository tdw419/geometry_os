; DESCRIPTION: Places a red line segment connecting (258, 27) to (33, 228).
; PLAN: r0=258(x1), r1=27(y1), r2=33(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 27
LDI r2, 33
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
