; DESCRIPTION: Composite: Sets a single cyan pixel at (75, 253) then Renders a red disk with center (386, 103) and radius 52 then Creates a magenta rectangular region at (293, 46) spanning 102 by 99 pixels.
; PLAN: r0=75(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=103(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=46(y), r12=102(width), r13=99(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 253
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 386
LDI r6, 103
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 46
LDI r12, 102
LDI r13, 99
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
