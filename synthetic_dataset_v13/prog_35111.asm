; DESCRIPTION: Draws a cyan line from (361, 29) to (57, 54).
; PLAN: r0=361(x1), r1=29(y1), r2=57(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 29
LDI r2, 57
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
