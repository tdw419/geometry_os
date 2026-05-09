; DESCRIPTION: Draws a white line from (128, 103) to (264, 138).
; PLAN: r0=128(x1), r1=103(y1), r2=264(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 103
LDI r2, 264
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
