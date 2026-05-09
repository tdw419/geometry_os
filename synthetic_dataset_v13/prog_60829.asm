; DESCRIPTION: Draws a cyan line from (442, 226) to (451, 231).
; PLAN: r0=442(x1), r1=226(y1), r2=451(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 226
LDI r2, 451
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
