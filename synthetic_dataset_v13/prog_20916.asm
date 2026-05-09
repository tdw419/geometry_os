; DESCRIPTION: Draws a red line from (360, 126) to (396, 42).
; PLAN: r0=360(x1), r1=126(y1), r2=396(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 126
LDI r2, 396
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
