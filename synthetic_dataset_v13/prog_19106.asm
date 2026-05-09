; DESCRIPTION: Draws a cyan line from (42, 89) to (420, 35).
; PLAN: r0=42(x1), r1=89(y1), r2=420(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 89
LDI r2, 420
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
