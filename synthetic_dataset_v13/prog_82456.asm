; DESCRIPTION: Renders a cyan line between points (510, 137) and (116, 221).
; PLAN: r0=510(x1), r1=137(y1), r2=116(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 137
LDI r2, 116
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
