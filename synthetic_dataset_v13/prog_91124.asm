; DESCRIPTION: Draws a green line from (304, 87) to (42, 31).
; PLAN: r0=304(x1), r1=87(y1), r2=42(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 87
LDI r2, 42
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
