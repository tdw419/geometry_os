; DESCRIPTION: Places a cyan line segment connecting (294, 46) to (316, 191).
; PLAN: r0=294(x1), r1=46(y1), r2=316(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 46
LDI r2, 316
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
