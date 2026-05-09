; DESCRIPTION: Draws a cyan line from (183, 78) to (260, 69).
; PLAN: r0=183(x1), r1=78(y1), r2=260(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 78
LDI r2, 260
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
