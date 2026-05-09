; DESCRIPTION: Draws a cyan line from (136, 11) to (284, 45).
; PLAN: r0=136(x1), r1=11(y1), r2=284(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 11
LDI r2, 284
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
