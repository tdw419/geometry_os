; DESCRIPTION: Composite: Places a cyan dot at position (250, 221) then Creates a green circular shape at (105, 152) with radius 38 then Renders a purple box of size 22x106 starting at (434, 115).
; PLAN: r0=250(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=152(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x), r11=115(y), r12=22(width), r13=106(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 152
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 115
LDI r12, 22
LDI r13, 106
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
