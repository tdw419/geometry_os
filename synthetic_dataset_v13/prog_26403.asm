; DESCRIPTION: Draws a cyan line from (217, 198) to (499, 74).
; PLAN: r0=217(x1), r1=198(y1), r2=499(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 198
LDI r2, 499
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
