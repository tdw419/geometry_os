; DESCRIPTION: Composite: Creates a magenta circular shape at (150, 170) with radius 69 then Renders a red box of size 25x36 starting at (148, 210) then Sets a single cyan pixel at (108, 213).
; PLAN: r0=150(x), r1=170(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=210(y), r7=25(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=213(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 170
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 210
LDI r7, 25
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 213
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
