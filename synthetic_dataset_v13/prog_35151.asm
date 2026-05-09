; DESCRIPTION: Composite: Draws a orange rectangle at (273, 147) with width 84 and height 105 then Places a white dot at position (95, 16) then Draws a magenta line from (82, 154) to (503, 57).
; PLAN: r0=273(x), r1=147(y), r2=84(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=82(x1), r11=154(y1), r12=503(x2), r13=57(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 147
LDI r2, 84
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 82
LDI r11, 154
LDI r12, 503
LDI r13, 57
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
