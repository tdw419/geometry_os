; DESCRIPTION: Composite: Places a magenta 63x66 rectangle at position (394, 85) then Renders a white line between points (275, 183) and (469, 131).
; PLAN: r0=394(x), r1=85(y), r2=63(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=183(y1), r7=469(x2), r8=131(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 85
LDI r2, 63
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 183
LDI r7, 469
LDI r8, 131
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
