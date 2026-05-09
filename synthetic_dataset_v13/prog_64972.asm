; DESCRIPTION: Composite: Places a black dot at position (48, 5) then Renders a black line between points (370, 82) and (386, 140) then Draws a white rectangle at (286, 151) with width 53 and height 44.
; PLAN: r0=48(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=370(x1), r6=82(y1), r7=386(x2), r8=140(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=151(y), r12=53(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 370
LDI r6, 82
LDI r7, 386
LDI r8, 140
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 151
LDI r12, 53
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
