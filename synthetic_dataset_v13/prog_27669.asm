; DESCRIPTION: Places a cyan line segment connecting (128, 178) to (485, 151).
; PLAN: r0=128(x1), r1=178(y1), r2=485(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 178
LDI r2, 485
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
