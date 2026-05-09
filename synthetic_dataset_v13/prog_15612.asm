; DESCRIPTION: Composite: Places a orange dot at position (113, 129) then Renders a yellow box of size 11x65 starting at (27, 125) then Creates a red circular shape at (387, 180) with radius 22.
; PLAN: r0=113(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=125(y), r7=11(width), r8=65(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=180(y), r12=22(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 129
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 27
LDI r6, 125
LDI r7, 11
LDI r8, 65
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 180
LDI r12, 22
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
