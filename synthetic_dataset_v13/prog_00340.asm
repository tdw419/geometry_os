; DESCRIPTION: Draws a white line from (116, 42) to (25, 126).
; PLAN: r0=116(x1), r1=42(y1), r2=25(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 42
LDI r2, 25
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
