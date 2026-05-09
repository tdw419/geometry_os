; DESCRIPTION: Draws a white line from (37, 151) to (166, 209).
; PLAN: r0=37(x1), r1=151(y1), r2=166(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 151
LDI r2, 166
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
