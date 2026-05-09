; DESCRIPTION: Composite: Places a cyan dot at position (54, 74) then Creates a blue rectangular region at (17, 222) spanning 58 by 30 pixels then Draws a white circle centered at (242, 103) with radius 50.
; PLAN: r0=54(x), r1=74(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=222(y), r7=58(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x), r11=103(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 74
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 222
LDI r7, 58
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 103
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
