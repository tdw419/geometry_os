; DESCRIPTION: Composite: Places a blue 27x12 rectangle at position (320, 149) then Draws a green line from (277, 240) to (383, 90) then Creates a magenta circular shape at (238, 138) with radius 43.
; PLAN: r0=320(x), r1=149(y), r2=27(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=240(y1), r7=383(x2), r8=90(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=138(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 149
LDI r2, 27
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 240
LDI r7, 383
LDI r8, 90
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 138
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
