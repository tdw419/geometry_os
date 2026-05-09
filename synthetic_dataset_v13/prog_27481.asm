; DESCRIPTION: Draws a white line from (354, 71) to (16, 214).
; PLAN: r0=354(x1), r1=71(y1), r2=16(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 71
LDI r2, 16
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
