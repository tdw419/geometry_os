; DESCRIPTION: Draws a white line from (122, 30) to (327, 228).
; PLAN: r0=122(x1), r1=30(y1), r2=327(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 30
LDI r2, 327
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
