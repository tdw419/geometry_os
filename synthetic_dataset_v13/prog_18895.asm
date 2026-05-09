; DESCRIPTION: Composite: Renders a orange disk with center (357, 111) and radius 31 then Renders a orange box of size 38x12 starting at (141, 144) then Sets a single red pixel at (94, 247).
; PLAN: r0=357(x), r1=111(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=144(y), r7=38(width), r8=12(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=247(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 111
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 144
LDI r7, 38
LDI r8, 12
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 247
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
