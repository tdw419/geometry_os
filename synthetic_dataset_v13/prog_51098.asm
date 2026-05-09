; DESCRIPTION: Draws a cyan line from (128, 129) to (30, 68).
; PLAN: r0=128(x1), r1=129(y1), r2=30(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 129
LDI r2, 30
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
