; DESCRIPTION: Composite: Places a green 113x64 rectangle at position (259, 82) then Places a white dot at position (76, 109) then Places a yellow line segment connecting (506, 232) to (186, 111).
; PLAN: r0=259(x), r1=82(y), r2=113(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=109(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=506(x1), r11=232(y1), r12=186(x2), r13=111(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 82
LDI r2, 113
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 109
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 506
LDI r11, 232
LDI r12, 186
LDI r13, 111
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
