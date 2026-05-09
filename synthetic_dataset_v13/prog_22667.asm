; DESCRIPTION: Composite: Renders a white line between points (120, 40) and (156, 171) then Creates a cyan rectangular region at (299, 225) spanning 82 by 29 pixels then Draws a magenta circle centered at (150, 87) with radius 24.
; PLAN: r0=120(x1), r1=40(y1), r2=156(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=225(y), r7=82(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x), r11=87(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 40
LDI r2, 156
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 225
LDI r7, 82
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 87
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
