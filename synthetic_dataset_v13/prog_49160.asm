; DESCRIPTION: Composite: Creates a yellow rectangular region at (267, 71) spanning 20 by 106 pixels then Renders a green disk with center (170, 111) and radius 27 then Places a cyan dot at position (385, 100).
; PLAN: r0=267(x), r1=71(y), r2=20(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=111(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=100(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 71
LDI r2, 20
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 111
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 100
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
