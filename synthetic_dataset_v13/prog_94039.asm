; DESCRIPTION: Draws a cyan line from (134, 125) to (471, 42).
; PLAN: r0=134(x1), r1=125(y1), r2=471(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 125
LDI r2, 471
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
