; DESCRIPTION: Composite: Creates a black circular shape at (384, 152) with radius 72 then Renders a magenta line between points (86, 71) and (210, 151) then Places a yellow 46x74 rectangle at position (150, 161).
; PLAN: r0=384(x), r1=152(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=71(y1), r7=210(x2), r8=151(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=161(y), r12=46(width), r13=74(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 152
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 71
LDI r7, 210
LDI r8, 151
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 161
LDI r12, 46
LDI r13, 74
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
