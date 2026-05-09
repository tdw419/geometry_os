; DESCRIPTION: Draws a white line from (16, 12) to (63, 228).
; PLAN: r0=16(x1), r1=12(y1), r2=63(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 12
LDI r2, 63
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
