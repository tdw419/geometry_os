; DESCRIPTION: Draws a cyan line from (214, 182) to (417, 188).
; PLAN: r0=214(x1), r1=182(y1), r2=417(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 182
LDI r2, 417
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
