; DESCRIPTION: Composite: Places a purple circle of radius 44 at center (259, 194) then Draws a black rectangle at (410, 75) with width 50 and height 46.
; PLAN: r0=259(x), r1=194(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=75(y), r7=50(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 194
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 75
LDI r7, 50
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
