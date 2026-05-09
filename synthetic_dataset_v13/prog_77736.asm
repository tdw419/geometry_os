; DESCRIPTION: Composite: Places a white 94x39 rectangle at position (38, 115) then Creates a magenta circular shape at (257, 172) with radius 15 then Draws a cyan line from (295, 164) to (304, 142).
; PLAN: r0=38(x), r1=115(y), r2=94(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=172(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x1), r11=164(y1), r12=304(x2), r13=142(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 115
LDI r2, 94
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 172
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 164
LDI r12, 304
LDI r13, 142
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
