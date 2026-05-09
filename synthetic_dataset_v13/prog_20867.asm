; DESCRIPTION: Composite: Places a green dot at position (285, 223) then Creates a cyan rectangular region at (217, 154) spanning 102 by 98 pixels then Draws a orange circle centered at (123, 95) with radius 79.
; PLAN: r0=285(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=154(y), r7=102(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=95(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 223
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 217
LDI r6, 154
LDI r7, 102
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 95
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
