; DESCRIPTION: Draws a cyan line from (448, 166) to (167, 109).
; PLAN: r0=448(x1), r1=166(y1), r2=167(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 166
LDI r2, 167
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
