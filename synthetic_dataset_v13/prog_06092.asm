; DESCRIPTION: Draws a cyan line from (42, 52) to (133, 98).
; PLAN: r0=42(x1), r1=52(y1), r2=133(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 52
LDI r2, 133
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
