; DESCRIPTION: Draws a cyan line from (8, 202) to (414, 72).
; PLAN: r0=8(x1), r1=202(y1), r2=414(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 202
LDI r2, 414
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
