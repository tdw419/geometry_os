; DESCRIPTION: Draws a cyan line from (432, 213) to (52, 192).
; PLAN: r0=432(x1), r1=213(y1), r2=52(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 213
LDI r2, 52
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
