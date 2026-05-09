; DESCRIPTION: Composite: Creates a white rectangular region at (494, 107) spanning 16 by 40 pixels then Draws a green circle centered at (281, 179) with radius 50 then Renders a green line between points (208, 236) and (64, 61).
; PLAN: r0=494(x), r1=107(y), r2=16(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=179(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x1), r11=236(y1), r12=64(x2), r13=61(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 107
LDI r2, 16
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 179
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 236
LDI r12, 64
LDI r13, 61
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
