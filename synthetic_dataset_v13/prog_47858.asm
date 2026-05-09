; DESCRIPTION: Draws a cyan line from (485, 24) to (401, 151).
; PLAN: r0=485(x1), r1=24(y1), r2=401(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 24
LDI r2, 401
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
