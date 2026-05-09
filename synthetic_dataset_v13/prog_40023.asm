; DESCRIPTION: Draws a cyan line from (344, 129) to (433, 63).
; PLAN: r0=344(x1), r1=129(y1), r2=433(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 129
LDI r2, 433
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
