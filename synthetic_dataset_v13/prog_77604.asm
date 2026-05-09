; DESCRIPTION: Composite: Creates a cyan circular shape at (141, 153) with radius 62 then Renders a orange box of size 44x39 starting at (140, 204) then Sets a single black pixel at (301, 207).
; PLAN: r0=141(x), r1=153(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=204(y), r7=44(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=207(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 153
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 204
LDI r7, 44
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 207
LDI r12, 0x000000
PSET r10, r11, r12
HALT
