; DESCRIPTION: Draws a cyan line from (135, 231) to (281, 98).
; PLAN: r0=135(x1), r1=231(y1), r2=281(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 231
LDI r2, 281
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
