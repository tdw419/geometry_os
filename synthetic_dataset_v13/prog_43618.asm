; DESCRIPTION: Composite: Creates a black circular shape at (262, 178) with radius 76 then Places a magenta 50x116 rectangle at position (401, 83) then Renders a black line between points (392, 241) and (228, 191).
; PLAN: r0=262(x), r1=178(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=83(y), r7=50(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=392(x1), r11=241(y1), r12=228(x2), r13=191(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 178
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 83
LDI r7, 50
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 241
LDI r12, 228
LDI r13, 191
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
