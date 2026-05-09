; DESCRIPTION: Composite: Creates a yellow circular shape at (469, 166) with radius 36 then Places a cyan dot at position (105, 28) then Renders a yellow line between points (228, 14) and (346, 55).
; PLAN: r0=469(x), r1=166(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=28(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=228(x1), r11=14(y1), r12=346(x2), r13=55(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 166
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 28
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 228
LDI r11, 14
LDI r12, 346
LDI r13, 55
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
