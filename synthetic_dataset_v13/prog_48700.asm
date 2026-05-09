; DESCRIPTION: Draws a green line from (481, 182) to (361, 228).
; PLAN: r0=481(x1), r1=182(y1), r2=361(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 182
LDI r2, 361
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
