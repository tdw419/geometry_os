; DESCRIPTION: Draws a cyan line from (76, 43) to (302, 13).
; PLAN: r0=76(x1), r1=43(y1), r2=302(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 43
LDI r2, 302
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
