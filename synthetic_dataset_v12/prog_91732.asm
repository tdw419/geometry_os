; DESCRIPTION: Composite: Draws a white line from (147, 93) to (120, 245) then Places a magenta 63x30 rectangle at position (83, 142).
; PLAN: r0=147(x1), r1=93(y1), r2=120(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=142(y), r7=63(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 93
LDI r2, 120
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 142
LDI r7, 63
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
