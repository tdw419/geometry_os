; DESCRIPTION: Composite: Renders a blue disk with center (333, 93) and radius 80 then Creates a cyan rectangular region at (59, 160) spanning 31 by 42 pixels then Renders a magenta line between points (67, 221) and (375, 212).
; PLAN: r0=333(x), r1=93(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=160(y), r7=31(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x1), r11=221(y1), r12=375(x2), r13=212(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 93
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 160
LDI r7, 31
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 221
LDI r12, 375
LDI r13, 212
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
