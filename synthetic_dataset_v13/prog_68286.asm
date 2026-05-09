; DESCRIPTION: Composite: Renders a yellow box of size 56x41 starting at (282, 129) then Creates a yellow circular shape at (216, 173) with radius 75 then Sets a single cyan pixel at (386, 196).
; PLAN: r0=282(x), r1=129(y), r2=56(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=173(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=196(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 129
LDI r2, 56
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 173
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 196
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
