; DESCRIPTION: Places a cyan line segment connecting (264, 67) to (24, 5).
; PLAN: r0=264(x1), r1=67(y1), r2=24(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 67
LDI r2, 24
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
