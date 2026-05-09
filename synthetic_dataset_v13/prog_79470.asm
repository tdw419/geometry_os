; DESCRIPTION: Draws a cyan line from (44, 20) to (485, 215).
; PLAN: r0=44(x1), r1=20(y1), r2=485(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 20
LDI r2, 485
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
