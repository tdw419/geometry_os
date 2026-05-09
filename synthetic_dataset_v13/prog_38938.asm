; DESCRIPTION: Draws a cyan line from (1, 213) to (194, 26).
; PLAN: r0=1(x1), r1=213(y1), r2=194(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 213
LDI r2, 194
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
