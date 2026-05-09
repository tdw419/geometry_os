; DESCRIPTION: Composite: Sets a single cyan pixel at (485, 80) then Places a red circle of radius 27 at center (422, 91) then Renders a black box of size 60x115 starting at (89, 76).
; PLAN: r0=485(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=91(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=89(x), r11=76(y), r12=60(width), r13=115(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 91
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 89
LDI r11, 76
LDI r12, 60
LDI r13, 115
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
