; DESCRIPTION: Places a cyan line segment connecting (275, 88) to (202, 178).
; PLAN: r0=275(x1), r1=88(y1), r2=202(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 88
LDI r2, 202
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
