; DESCRIPTION: Composite: Creates a yellow rectangular region at (233, 151) spanning 71 by 47 pixels then Places a cyan dot at position (138, 3) then Places a white line segment connecting (506, 250) to (170, 111).
; PLAN: r0=233(x), r1=151(y), r2=71(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=3(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=506(x1), r11=250(y1), r12=170(x2), r13=111(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 151
LDI r2, 71
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 3
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 506
LDI r11, 250
LDI r12, 170
LDI r13, 111
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
