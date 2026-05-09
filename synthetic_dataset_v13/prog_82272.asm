; DESCRIPTION: Draws a cyan line from (184, 183) to (159, 154).
; PLAN: r0=184(x1), r1=183(y1), r2=159(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 183
LDI r2, 159
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
