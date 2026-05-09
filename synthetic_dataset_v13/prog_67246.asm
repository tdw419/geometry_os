; DESCRIPTION: Draws a cyan line from (174, 19) to (135, 17).
; PLAN: r0=174(x1), r1=19(y1), r2=135(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 19
LDI r2, 135
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
