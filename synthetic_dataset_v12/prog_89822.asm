; DESCRIPTION: Composite: Creates a cyan rectangular region at (456, 207) spanning 41 by 39 pixels then Sets a single green pixel at (444, 242) then Draws a purple circle centered at (410, 135) with radius 28.
; PLAN: r0=456(x), r1=207(y), r2=41(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=242(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=410(x), r11=135(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 456
LDI r1, 207
LDI r2, 41
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 242
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 410
LDI r11, 135
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
