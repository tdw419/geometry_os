; DESCRIPTION: Composite: Renders a green box of size 73x57 starting at (52, 162) then Creates a red circular shape at (436, 129) with radius 47 then Sets a single orange pixel at (423, 47).
; PLAN: r0=52(x), r1=162(y), r2=73(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=129(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=47(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 162
LDI r2, 73
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 129
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 47
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
