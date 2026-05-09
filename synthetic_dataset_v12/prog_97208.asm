; DESCRIPTION: Draws a cyan line from (429, 182) to (304, 32).
; PLAN: r0=429(x1), r1=182(y1), r2=304(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 182
LDI r2, 304
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
