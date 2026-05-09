; DESCRIPTION: Draws a cyan line from (231, 111) to (269, 3).
; PLAN: r0=231(x1), r1=111(y1), r2=269(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 111
LDI r2, 269
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
