; DESCRIPTION: Composite: Sets a single yellow pixel at (409, 166) then Places a white 84x42 rectangle at position (424, 210) then Draws a purple line from (509, 221) to (27, 178).
; PLAN: r0=409(x), r1=166(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=210(y), r7=84(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=509(x1), r11=221(y1), r12=27(x2), r13=178(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 166
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 424
LDI r6, 210
LDI r7, 84
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 221
LDI r12, 27
LDI r13, 178
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
