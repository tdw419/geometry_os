; DESCRIPTION: Composite: Renders a yellow disk with center (305, 79) and radius 55 then Renders a yellow box of size 102x115 starting at (397, 125) then Places a blue dot at position (78, 91).
; PLAN: r0=305(x), r1=79(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=125(y), r7=102(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x), r11=91(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 79
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 125
LDI r7, 102
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 91
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
