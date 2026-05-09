; DESCRIPTION: Composite: Creates a purple circular shape at (231, 91) with radius 31 then Creates a cyan rectangular region at (301, 5) spanning 108 by 120 pixels.
; PLAN: r0=231(x), r1=91(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=5(y), r7=108(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 91
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 5
LDI r7, 108
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
