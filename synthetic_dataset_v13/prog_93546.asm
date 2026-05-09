; DESCRIPTION: Draws a white line from (228, 42) to (150, 21).
; PLAN: r0=228(x1), r1=42(y1), r2=150(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 42
LDI r2, 150
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
