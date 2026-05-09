; DESCRIPTION: Places a cyan line segment connecting (12, 248) to (496, 113).
; PLAN: r0=12(x1), r1=248(y1), r2=496(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 248
LDI r2, 496
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
