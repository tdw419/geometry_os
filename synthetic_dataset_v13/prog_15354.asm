; DESCRIPTION: Draws a cyan line from (428, 203) to (333, 19).
; PLAN: r0=428(x1), r1=203(y1), r2=333(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 203
LDI r2, 333
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
