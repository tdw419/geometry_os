; DESCRIPTION: Composite: Creates a cyan circular shape at (94, 161) with radius 70 then Creates a orange rectangular region at (218, 216) spanning 54 by 13 pixels.
; PLAN: r0=94(x), r1=161(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=216(y), r7=54(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 161
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 216
LDI r7, 54
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
