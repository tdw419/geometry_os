; DESCRIPTION: Composite: Places a yellow line segment connecting (410, 94) to (239, 96) then Places a black dot at position (281, 34) then Renders a magenta box of size 32x39 starting at (220, 8).
; PLAN: r0=410(x1), r1=94(y1), r2=239(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=34(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=8(y), r12=32(width), r13=39(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 94
LDI r2, 239
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 34
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 220
LDI r11, 8
LDI r12, 32
LDI r13, 39
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
