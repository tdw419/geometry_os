; DESCRIPTION: Draws a white line from (27, 27) to (183, 242).
; PLAN: r0=27(x1), r1=27(y1), r2=183(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 27
LDI r2, 183
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
