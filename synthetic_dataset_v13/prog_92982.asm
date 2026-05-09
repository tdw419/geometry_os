; DESCRIPTION: Composite: Draws a white line from (281, 241) to (91, 229) then Places a green circle of radius 64 at center (383, 177) then Creates a orange rectangular region at (195, 47) spanning 77 by 113 pixels.
; PLAN: r0=281(x1), r1=241(y1), r2=91(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=177(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=47(y), r12=77(width), r13=113(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 241
LDI r2, 91
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 177
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 47
LDI r12, 77
LDI r13, 113
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
