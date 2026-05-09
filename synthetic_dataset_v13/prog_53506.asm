; DESCRIPTION: Composite: Places a cyan dot at position (290, 132) then Places a red circle of radius 77 at center (91, 169) then Renders a white box of size 39x118 starting at (416, 79).
; PLAN: r0=290(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=169(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x), r11=79(y), r12=39(width), r13=118(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 169
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 79
LDI r12, 39
LDI r13, 118
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
