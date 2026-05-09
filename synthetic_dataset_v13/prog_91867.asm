; DESCRIPTION: Draws a cyan line from (264, 217) to (44, 87).
; PLAN: r0=264(x1), r1=217(y1), r2=44(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 217
LDI r2, 44
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
