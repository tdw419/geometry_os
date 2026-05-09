; DESCRIPTION: Draws a white line from (207, 146) to (280, 144).
; PLAN: r0=207(x1), r1=146(y1), r2=280(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 146
LDI r2, 280
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
