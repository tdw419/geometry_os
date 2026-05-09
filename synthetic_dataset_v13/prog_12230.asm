; DESCRIPTION: Draws a cyan line from (286, 255) to (505, 176).
; PLAN: r0=286(x1), r1=255(y1), r2=505(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 255
LDI r2, 505
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
