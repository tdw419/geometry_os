; DESCRIPTION: Composite: Places a blue line segment connecting (74, 148) to (482, 173) then Places a cyan dot at position (460, 14) then Renders a cyan box of size 74x42 starting at (143, 158).
; PLAN: r0=74(x1), r1=148(y1), r2=482(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=14(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=158(y), r12=74(width), r13=42(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 148
LDI r2, 482
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 14
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 158
LDI r12, 74
LDI r13, 42
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
