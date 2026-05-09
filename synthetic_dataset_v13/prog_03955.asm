; DESCRIPTION: Draws a cyan line from (280, 251) to (331, 206).
; PLAN: r0=280(x1), r1=251(y1), r2=331(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 251
LDI r2, 331
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
