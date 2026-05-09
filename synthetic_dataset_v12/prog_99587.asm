; DESCRIPTION: Composite: Draws a blue circle centered at (284, 173) with radius 39 then Places a green line segment connecting (304, 152) to (509, 115) then Places a red dot at position (173, 158).
; PLAN: r0=284(x), r1=173(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=152(y1), r7=509(x2), r8=115(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=173(x), r11=158(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 173
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 152
LDI r7, 509
LDI r8, 115
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 158
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
