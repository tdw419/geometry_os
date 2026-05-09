; DESCRIPTION: Draws a cyan line from (347, 210) to (274, 176).
; PLAN: r0=347(x1), r1=210(y1), r2=274(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 210
LDI r2, 274
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
