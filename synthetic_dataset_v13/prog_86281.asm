; DESCRIPTION: Draws a cyan line from (183, 129) to (320, 234).
; PLAN: r0=183(x1), r1=129(y1), r2=320(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 129
LDI r2, 320
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
