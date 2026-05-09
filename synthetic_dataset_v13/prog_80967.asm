; DESCRIPTION: Composite: Places a green dot at position (320, 96) then Draws a yellow circle centered at (470, 174) with radius 40.
; PLAN: r0=320(x), r1=96(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=470(x), r6=174(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 96
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 470
LDI r6, 174
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
