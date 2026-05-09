; DESCRIPTION: Draws a white line from (156, 152) to (165, 224).
; PLAN: r0=156(x1), r1=152(y1), r2=165(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 152
LDI r2, 165
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
