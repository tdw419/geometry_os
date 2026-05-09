; DESCRIPTION: Composite: Draws a white line from (163, 193) to (245, 79) then Places a red 57x36 rectangle at position (261, 152).
; PLAN: r0=163(x1), r1=193(y1), r2=245(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=152(y), r7=57(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 193
LDI r2, 245
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 152
LDI r7, 57
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
