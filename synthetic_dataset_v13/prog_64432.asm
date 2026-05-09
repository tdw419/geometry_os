; DESCRIPTION: Composite: Creates a yellow circular shape at (109, 89) with radius 54 then Creates a orange rectangular region at (445, 29) spanning 36 by 42 pixels.
; PLAN: r0=109(x), r1=89(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=29(y), r7=36(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 89
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 29
LDI r7, 36
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
