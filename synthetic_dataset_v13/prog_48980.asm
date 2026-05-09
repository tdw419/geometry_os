; DESCRIPTION: Composite: Places a white circle of radius 11 at center (82, 197) then Places a black dot at position (453, 208) then Places a green 85x58 rectangle at position (262, 16).
; PLAN: r0=82(x), r1=197(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=262(x), r11=16(y), r12=85(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 197
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 262
LDI r11, 16
LDI r12, 85
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
