; DESCRIPTION: Draws a cyan line from (320, 174) to (381, 19).
; PLAN: r0=320(x1), r1=174(y1), r2=381(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 174
LDI r2, 381
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
