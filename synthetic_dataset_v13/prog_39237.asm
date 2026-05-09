; DESCRIPTION: Composite: Renders a orange disk with center (353, 100) and radius 68 then Renders a cyan box of size 47x24 starting at (287, 111) then Sets a single red pixel at (399, 60).
; PLAN: r0=353(x), r1=100(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=111(y), r7=47(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x), r11=60(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 100
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 111
LDI r7, 47
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 60
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
