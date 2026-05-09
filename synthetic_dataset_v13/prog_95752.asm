; DESCRIPTION: Draws a cyan line from (46, 157) to (166, 62).
; PLAN: r0=46(x1), r1=157(y1), r2=166(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 157
LDI r2, 166
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
