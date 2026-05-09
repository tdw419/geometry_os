; DESCRIPTION: Draws a cyan line from (159, 45) to (116, 154).
; PLAN: r0=159(x1), r1=45(y1), r2=116(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 45
LDI r2, 116
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
