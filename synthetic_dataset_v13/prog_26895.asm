; DESCRIPTION: Composite: Places a blue 28x83 rectangle at position (429, 147) then Renders a purple line between points (477, 222) and (473, 211) then Places a magenta dot at position (503, 14).
; PLAN: r0=429(x), r1=147(y), r2=28(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x1), r6=222(y1), r7=473(x2), r8=211(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=14(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 147
LDI r2, 28
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 222
LDI r7, 473
LDI r8, 211
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 14
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
