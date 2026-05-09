; DESCRIPTION: Draws a cyan line from (459, 179) to (225, 186).
; PLAN: r0=459(x1), r1=179(y1), r2=225(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 179
LDI r2, 225
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
