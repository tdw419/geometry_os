; DESCRIPTION: Composite: Draws a cyan circle centered at (156, 168) with radius 42 then Draws a yellow line from (133, 63) to (463, 207) then Draws a red rectangle at (7, 160) with width 93 and height 27.
; PLAN: r0=156(x), r1=168(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x1), r6=63(y1), r7=463(x2), r8=207(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=160(y), r12=93(width), r13=27(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 168
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 63
LDI r7, 463
LDI r8, 207
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 160
LDI r12, 93
LDI r13, 27
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
