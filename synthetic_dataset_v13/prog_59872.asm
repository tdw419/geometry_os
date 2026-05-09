; DESCRIPTION: Composite: Renders a blue line between points (346, 208) and (284, 171) then Renders a cyan box of size 63x47 starting at (347, 64) then Places a red circle of radius 56 at center (413, 178).
; PLAN: r0=346(x1), r1=208(y1), r2=284(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=64(y), r7=63(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=178(y), r12=56(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 208
LDI r2, 284
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 64
LDI r7, 63
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 178
LDI r12, 56
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
