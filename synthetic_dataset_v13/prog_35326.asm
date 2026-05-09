; DESCRIPTION: Draws a red line from (239, 96) to (485, 254).
; PLAN: r0=239(x1), r1=96(y1), r2=485(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 96
LDI r2, 485
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
