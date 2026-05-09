; DESCRIPTION: Composite: Sets a single white pixel at (172, 46) then Renders a cyan box of size 47x80 starting at (191, 107) then Renders a yellow line between points (117, 54) and (310, 245).
; PLAN: r0=172(x), r1=46(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=107(y), r7=47(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x1), r11=54(y1), r12=310(x2), r13=245(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 46
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 107
LDI r7, 47
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 54
LDI r12, 310
LDI r13, 245
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
