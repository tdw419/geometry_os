; DESCRIPTION: Draws a cyan line from (58, 81) to (130, 186).
; PLAN: r0=58(x1), r1=81(y1), r2=130(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 81
LDI r2, 130
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
