; DESCRIPTION: Draws a cyan line from (377, 129) to (6, 180).
; PLAN: r0=377(x1), r1=129(y1), r2=6(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 129
LDI r2, 6
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
