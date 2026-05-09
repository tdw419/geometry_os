; DESCRIPTION: Composite: Creates a magenta circular shape at (321, 68) with radius 33 then Places a white line segment connecting (406, 14) to (410, 62) then Places a orange dot at position (327, 140).
; PLAN: r0=321(x), r1=68(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=14(y1), r7=410(x2), r8=62(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=140(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 68
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 14
LDI r7, 410
LDI r8, 62
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 140
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
