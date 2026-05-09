; DESCRIPTION: Composite: Places a cyan dot at position (482, 193) then Creates a yellow circular shape at (125, 141) with radius 76 then Places a red line segment connecting (498, 68) to (182, 177).
; PLAN: r0=482(x), r1=193(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=141(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x1), r11=68(y1), r12=182(x2), r13=177(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 193
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 141
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 68
LDI r12, 182
LDI r13, 177
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
