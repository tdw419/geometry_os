; DESCRIPTION: Draws a cyan line from (344, 26) to (26, 242).
; PLAN: r0=344(x1), r1=26(y1), r2=26(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 26
LDI r2, 26
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
