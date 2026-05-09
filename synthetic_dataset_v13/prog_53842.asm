; DESCRIPTION: Draws a cyan line from (56, 33) to (399, 206).
; PLAN: r0=56(x1), r1=33(y1), r2=399(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 33
LDI r2, 399
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
