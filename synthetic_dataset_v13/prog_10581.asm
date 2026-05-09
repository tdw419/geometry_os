; DESCRIPTION: Composite: Renders a magenta line between points (81, 60) and (441, 144) then Creates a white rectangular region at (382, 66) spanning 58 by 83 pixels.
; PLAN: r0=81(x1), r1=60(y1), r2=441(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=66(y), r7=58(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 60
LDI r2, 441
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 66
LDI r7, 58
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
