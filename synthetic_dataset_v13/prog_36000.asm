; DESCRIPTION: Composite: Renders a white line between points (441, 182) and (353, 151) then Places a red dot at position (233, 255) then Places a blue 18x116 rectangle at position (196, 111).
; PLAN: r0=441(x1), r1=182(y1), r2=353(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=255(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=196(x), r11=111(y), r12=18(width), r13=116(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 182
LDI r2, 353
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 255
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 196
LDI r11, 111
LDI r12, 18
LDI r13, 116
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
