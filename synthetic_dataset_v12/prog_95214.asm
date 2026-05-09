; DESCRIPTION: Composite: Renders a cyan disk with center (286, 121) and radius 77 then Places a cyan dot at position (102, 87) then Creates a green rectangular region at (46, 132) spanning 71 by 72 pixels.
; PLAN: r0=286(x), r1=121(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=87(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=132(y), r12=71(width), r13=72(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 121
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 87
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 46
LDI r11, 132
LDI r12, 71
LDI r13, 72
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
