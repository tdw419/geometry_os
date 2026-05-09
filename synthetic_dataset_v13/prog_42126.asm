; DESCRIPTION: Draws a cyan line from (66, 152) to (15, 63).
; PLAN: r0=66(x1), r1=152(y1), r2=15(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 152
LDI r2, 15
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
