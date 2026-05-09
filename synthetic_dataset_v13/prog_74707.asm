; DESCRIPTION: Places a cyan line segment connecting (376, 234) to (167, 107).
; PLAN: r0=376(x1), r1=234(y1), r2=167(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 234
LDI r2, 167
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
