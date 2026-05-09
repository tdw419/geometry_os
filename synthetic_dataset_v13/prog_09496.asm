; DESCRIPTION: Places a cyan line segment connecting (485, 249) to (59, 158).
; PLAN: r0=485(x1), r1=249(y1), r2=59(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 249
LDI r2, 59
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
