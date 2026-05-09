; DESCRIPTION: Composite: Sets a single green pixel at (324, 10) then Draws a cyan rectangle at (387, 113) with width 55 and height 76 then Places a green circle of radius 53 at center (367, 201).
; PLAN: r0=324(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=113(y), r7=55(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=201(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 387
LDI r6, 113
LDI r7, 55
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 201
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
