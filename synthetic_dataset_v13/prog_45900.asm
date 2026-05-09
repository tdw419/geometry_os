; DESCRIPTION: Draws a cyan line from (315, 142) to (205, 91).
; PLAN: r0=315(x1), r1=142(y1), r2=205(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 142
LDI r2, 205
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
