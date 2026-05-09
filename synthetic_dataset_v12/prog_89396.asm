; DESCRIPTION: Composite: Creates a yellow circular shape at (242, 123) with radius 33 then Renders a cyan box of size 108x107 starting at (160, 38) then Sets a single white pixel at (377, 239).
; PLAN: r0=242(x), r1=123(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=38(y), r7=108(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x), r11=239(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 123
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 38
LDI r7, 108
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 239
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
