; DESCRIPTION: Draws a cyan line from (135, 129) to (276, 2).
; PLAN: r0=135(x1), r1=129(y1), r2=276(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 129
LDI r2, 276
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
