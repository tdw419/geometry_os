; DESCRIPTION: Places a cyan line segment connecting (414, 27) to (197, 170).
; PLAN: r0=414(x1), r1=27(y1), r2=197(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 27
LDI r2, 197
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
