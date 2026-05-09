; DESCRIPTION: Composite: Draws a blue line from (370, 45) to (301, 223) then Creates a black circular shape at (386, 98) with radius 59 then Places a green 13x64 rectangle at position (38, 101).
; PLAN: r0=370(x1), r1=45(y1), r2=301(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=98(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=101(y), r12=13(width), r13=64(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 45
LDI r2, 301
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 98
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 101
LDI r12, 13
LDI r13, 64
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
