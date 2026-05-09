; DESCRIPTION: Draws a cyan line from (221, 104) to (75, 114).
; PLAN: r0=221(x1), r1=104(y1), r2=75(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 104
LDI r2, 75
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
