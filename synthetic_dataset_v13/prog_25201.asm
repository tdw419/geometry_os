; DESCRIPTION: Draws a cyan line from (309, 144) to (265, 160).
; PLAN: r0=309(x1), r1=144(y1), r2=265(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 144
LDI r2, 265
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
