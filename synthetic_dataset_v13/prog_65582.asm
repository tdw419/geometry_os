; DESCRIPTION: Places a cyan line segment connecting (166, 67) to (275, 62).
; PLAN: r0=166(x1), r1=67(y1), r2=275(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 67
LDI r2, 275
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
