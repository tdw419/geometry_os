; DESCRIPTION: Composite: Places a yellow dot at position (25, 196) then Places a white 13x90 rectangle at position (359, 109) then Renders a magenta disk with center (218, 152) and radius 26.
; PLAN: r0=25(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=109(y), r7=13(width), r8=90(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=152(y), r12=26(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 359
LDI r6, 109
LDI r7, 13
LDI r8, 90
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 152
LDI r12, 26
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
