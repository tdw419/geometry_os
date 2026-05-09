; DESCRIPTION: Draws a cyan line from (54, 237) to (87, 90).
; PLAN: r0=54(x1), r1=237(y1), r2=87(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 237
LDI r2, 87
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
