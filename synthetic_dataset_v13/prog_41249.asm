; DESCRIPTION: Composite: Places a yellow dot at position (479, 62) then Creates a magenta rectangular region at (171, 103) spanning 59 by 68 pixels then Draws a cyan circle centered at (367, 110) with radius 44.
; PLAN: r0=479(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=103(y), r7=59(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=110(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 479
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 171
LDI r6, 103
LDI r7, 59
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 110
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
