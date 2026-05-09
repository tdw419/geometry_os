; DESCRIPTION: Composite: Draws a cyan line from (125, 228) to (367, 219) then Draws a blue rectangle at (320, 143) with width 61 and height 37 then Creates a magenta circular shape at (175, 87) with radius 60.
; PLAN: r0=125(x1), r1=228(y1), r2=367(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=143(y), r7=61(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=87(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 228
LDI r2, 367
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 143
LDI r7, 61
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 87
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
