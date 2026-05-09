; DESCRIPTION: Composite: Sets a single yellow pixel at (28, 42) then Draws a cyan rectangle at (410, 154) with width 34 and height 10 then Places a magenta circle of radius 70 at center (110, 110).
; PLAN: r0=28(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=154(y), r7=34(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x), r11=110(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 154
LDI r7, 34
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 110
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
