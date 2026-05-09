; DESCRIPTION: Draws a cyan line from (303, 176) to (144, 62).
; PLAN: r0=303(x1), r1=176(y1), r2=144(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 176
LDI r2, 144
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
