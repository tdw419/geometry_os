; DESCRIPTION: Draws a cyan line from (79, 156) to (228, 189).
; PLAN: r0=79(x1), r1=156(y1), r2=228(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 156
LDI r2, 228
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
