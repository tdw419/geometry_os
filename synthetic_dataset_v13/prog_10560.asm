; DESCRIPTION: Composite: Sets a single yellow pixel at (164, 203) then Places a cyan line segment connecting (239, 58) to (386, 171) then Draws a yellow circle centered at (254, 57) with radius 27.
; PLAN: r0=164(x), r1=203(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=239(x1), r6=58(y1), r7=386(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=57(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 203
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 239
LDI r6, 58
LDI r7, 386
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 57
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
