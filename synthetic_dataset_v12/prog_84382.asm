; DESCRIPTION: Composite: Renders a yellow line between points (408, 72) and (168, 64) then Places a green 26x13 rectangle at position (168, 234) then Sets a single green pixel at (96, 42).
; PLAN: r0=408(x1), r1=72(y1), r2=168(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=234(y), r7=26(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=42(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 72
LDI r2, 168
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 234
LDI r7, 26
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 42
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
