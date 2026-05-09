; DESCRIPTION: Composite: Places a black circle of radius 25 at center (146, 218) then Creates a cyan rectangular region at (162, 155) spanning 94 by 72 pixels.
; PLAN: r0=146(x), r1=218(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=155(y), r7=94(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 218
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 155
LDI r7, 94
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
