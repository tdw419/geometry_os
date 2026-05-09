; DESCRIPTION: Composite: Creates a orange circular shape at (282, 101) with radius 60 then Places a orange 82x59 rectangle at position (214, 26) then Renders a yellow line between points (418, 193) and (146, 168).
; PLAN: r0=282(x), r1=101(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=26(y), r7=82(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=193(y1), r12=146(x2), r13=168(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 101
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 26
LDI r7, 82
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 193
LDI r12, 146
LDI r13, 168
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
