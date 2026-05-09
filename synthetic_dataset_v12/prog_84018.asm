; DESCRIPTION: Composite: Places a cyan 42x105 rectangle at position (256, 75) then Sets a single magenta pixel at (390, 239) then Renders a cyan line between points (156, 206) and (28, 238).
; PLAN: r0=256(x), r1=75(y), r2=42(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=239(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=156(x1), r11=206(y1), r12=28(x2), r13=238(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 75
LDI r2, 42
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 239
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 156
LDI r11, 206
LDI r12, 28
LDI r13, 238
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
