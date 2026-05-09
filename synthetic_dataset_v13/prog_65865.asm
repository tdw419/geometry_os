; DESCRIPTION: Composite: Places a black circle of radius 42 at center (392, 205) then Places a red line segment connecting (299, 11) to (493, 221) then Places a black 79x16 rectangle at position (64, 223).
; PLAN: r0=392(x), r1=205(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=11(y1), r7=493(x2), r8=221(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=223(y), r12=79(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 205
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 11
LDI r7, 493
LDI r8, 221
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 223
LDI r12, 79
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
