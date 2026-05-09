; DESCRIPTION: Draws a cyan line from (205, 142) to (353, 177).
; PLAN: r0=205(x1), r1=142(y1), r2=353(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 142
LDI r2, 353
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
