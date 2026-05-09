; DESCRIPTION: Draws a green line from (320, 211) to (202, 129).
; PLAN: r0=320(x1), r1=211(y1), r2=202(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 211
LDI r2, 202
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
