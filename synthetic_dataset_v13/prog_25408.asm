; DESCRIPTION: Draws a cyan line from (372, 129) to (12, 90).
; PLAN: r0=372(x1), r1=129(y1), r2=12(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 129
LDI r2, 12
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
