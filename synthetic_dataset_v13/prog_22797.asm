; DESCRIPTION: Draws a cyan line from (339, 199) to (269, 197).
; PLAN: r0=339(x1), r1=199(y1), r2=269(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 199
LDI r2, 269
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
