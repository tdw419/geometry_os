; DESCRIPTION: Draws a cyan line from (173, 134) to (9, 122).
; PLAN: r0=173(x1), r1=134(y1), r2=9(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 134
LDI r2, 9
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
