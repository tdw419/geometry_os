; DESCRIPTION: Composite: Places a yellow circle of radius 58 at center (364, 79) then Renders a blue box of size 48x66 starting at (301, 98).
; PLAN: r0=364(x), r1=79(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=98(y), r7=48(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 79
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 98
LDI r7, 48
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
