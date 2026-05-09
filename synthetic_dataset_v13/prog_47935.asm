; DESCRIPTION: Draws a cyan line from (268, 36) to (40, 61).
; PLAN: r0=268(x1), r1=36(y1), r2=40(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 36
LDI r2, 40
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
