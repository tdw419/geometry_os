; DESCRIPTION: Draws a cyan line from (249, 165) to (126, 128).
; PLAN: r0=249(x1), r1=165(y1), r2=126(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 165
LDI r2, 126
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
