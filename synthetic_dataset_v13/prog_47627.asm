; DESCRIPTION: Draws a cyan line from (508, 7) to (254, 222).
; PLAN: r0=508(x1), r1=7(y1), r2=254(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 7
LDI r2, 254
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
