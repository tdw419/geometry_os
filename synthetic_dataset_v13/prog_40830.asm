; DESCRIPTION: Draws a cyan line from (439, 129) to (178, 100).
; PLAN: r0=439(x1), r1=129(y1), r2=178(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 129
LDI r2, 178
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
