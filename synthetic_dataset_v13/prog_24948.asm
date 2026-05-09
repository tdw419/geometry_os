; DESCRIPTION: Draws a cyan line from (205, 48) to (206, 217).
; PLAN: r0=205(x1), r1=48(y1), r2=206(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 48
LDI r2, 206
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
