; DESCRIPTION: Draws a cyan line from (124, 49) to (25, 68).
; PLAN: r0=124(x1), r1=49(y1), r2=25(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 49
LDI r2, 25
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
