; DESCRIPTION: Draws a cyan line from (139, 156) to (42, 182).
; PLAN: r0=139(x1), r1=156(y1), r2=42(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 156
LDI r2, 42
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
