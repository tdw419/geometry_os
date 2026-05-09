; DESCRIPTION: Draws a cyan line from (220, 206) to (301, 101).
; PLAN: r0=220(x1), r1=206(y1), r2=301(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 206
LDI r2, 301
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
