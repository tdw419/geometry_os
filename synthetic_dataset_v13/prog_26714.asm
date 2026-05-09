; DESCRIPTION: Draws a cyan line from (253, 43) to (420, 176).
; PLAN: r0=253(x1), r1=43(y1), r2=420(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 43
LDI r2, 420
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
