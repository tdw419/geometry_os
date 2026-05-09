; DESCRIPTION: Composite: Places a green circle of radius 55 at center (448, 178) then Renders a cyan box of size 94x108 starting at (213, 126) then Sets a single white pixel at (0, 218).
; PLAN: r0=448(x), r1=178(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=126(y), r7=94(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x), r11=218(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 178
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 126
LDI r7, 94
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 218
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
