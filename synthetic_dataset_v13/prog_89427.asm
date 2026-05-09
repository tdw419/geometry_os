; DESCRIPTION: Composite: Sets a single cyan pixel at (305, 124) then Renders a black box of size 24x105 starting at (10, 5) then Places a orange circle of radius 54 at center (293, 198).
; PLAN: r0=305(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=5(y), r7=24(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x), r11=198(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 5
LDI r7, 24
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 198
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
