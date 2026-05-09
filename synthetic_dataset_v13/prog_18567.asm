; DESCRIPTION: Draws a white line from (89, 16) to (277, 228).
; PLAN: r0=89(x1), r1=16(y1), r2=277(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 16
LDI r2, 277
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
