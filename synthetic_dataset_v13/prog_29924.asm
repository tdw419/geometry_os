; DESCRIPTION: Draws a green line from (244, 186) to (272, 108).
; PLAN: r0=244(x1), r1=186(y1), r2=272(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 186
LDI r2, 272
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
