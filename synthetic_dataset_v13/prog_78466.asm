; DESCRIPTION: Draws a white line from (247, 214) to (13, 228).
; PLAN: r0=247(x1), r1=214(y1), r2=13(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 214
LDI r2, 13
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
