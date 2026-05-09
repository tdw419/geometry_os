; DESCRIPTION: Composite: Renders a yellow disk with center (475, 126) and radius 31 then Places a cyan dot at position (448, 161) then Creates a green rectangular region at (380, 16) spanning 47 by 70 pixels.
; PLAN: r0=475(x), r1=126(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=161(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=380(x), r11=16(y), r12=47(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 126
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 161
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 380
LDI r11, 16
LDI r12, 47
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
