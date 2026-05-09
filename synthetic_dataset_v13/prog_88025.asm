; DESCRIPTION: Draws a cyan line from (425, 105) to (15, 192).
; PLAN: r0=425(x1), r1=105(y1), r2=15(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 105
LDI r2, 15
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
