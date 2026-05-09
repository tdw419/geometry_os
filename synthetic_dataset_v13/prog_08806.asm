; DESCRIPTION: Composite: Places a black circle of radius 54 at center (54, 168) then Draws a orange rectangle at (236, 61) with width 86 and height 70 then Sets a single magenta pixel at (19, 242).
; PLAN: r0=54(x), r1=168(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=61(y), r7=86(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=19(x), r11=242(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 168
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 61
LDI r7, 86
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 242
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
