; DESCRIPTION: Draws a cyan line from (485, 213) to (255, 126).
; PLAN: r0=485(x1), r1=213(y1), r2=255(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 213
LDI r2, 255
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
