; DESCRIPTION: Composite: Draws a orange rectangle at (218, 146) with width 115 and height 47 then Places a magenta dot at position (25, 43) then Renders a green line between points (247, 78) and (281, 228).
; PLAN: r0=218(x), r1=146(y), r2=115(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x), r6=43(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=247(x1), r11=78(y1), r12=281(x2), r13=228(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 146
LDI r2, 115
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 43
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 78
LDI r12, 281
LDI r13, 228
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
