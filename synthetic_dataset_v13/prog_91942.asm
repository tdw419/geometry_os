; DESCRIPTION: Renders a cyan line between points (291, 252) and (485, 231).
; PLAN: r0=291(x1), r1=252(y1), r2=485(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 252
LDI r2, 485
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
