; DESCRIPTION: Composite: Creates a yellow rectangular region at (378, 39) spanning 46 by 71 pixels then Places a red dot at position (441, 196) then Draws a white line from (52, 239) to (23, 195).
; PLAN: r0=378(x), r1=39(y), r2=46(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=196(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=52(x1), r11=239(y1), r12=23(x2), r13=195(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 39
LDI r2, 46
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 196
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 52
LDI r11, 239
LDI r12, 23
LDI r13, 195
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
