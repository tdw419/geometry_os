; DESCRIPTION: Draws a cyan line from (248, 62) to (495, 44).
; PLAN: r0=248(x1), r1=62(y1), r2=495(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 62
LDI r2, 495
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
