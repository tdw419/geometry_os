; DESCRIPTION: Composite: Creates a orange circular shape at (405, 127) with radius 65 then Places a white line segment connecting (327, 167) to (187, 205).
; PLAN: r0=405(x), r1=127(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x1), r6=167(y1), r7=187(x2), r8=205(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 127
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 167
LDI r7, 187
LDI r8, 205
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
