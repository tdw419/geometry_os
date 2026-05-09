; DESCRIPTION: Places a cyan line segment connecting (191, 62) to (376, 113).
; PLAN: r0=191(x1), r1=62(y1), r2=376(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 62
LDI r2, 376
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
