; DESCRIPTION: Draws a cyan line from (231, 250) to (255, 143).
; PLAN: r0=231(x1), r1=250(y1), r2=255(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 250
LDI r2, 255
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
