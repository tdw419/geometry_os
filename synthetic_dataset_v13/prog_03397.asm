; DESCRIPTION: Draws a cyan line from (279, 97) to (238, 191).
; PLAN: r0=279(x1), r1=97(y1), r2=238(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 97
LDI r2, 238
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
