; DESCRIPTION: Composite: Places a cyan dot at position (379, 224) then Draws a cyan circle centered at (298, 110) with radius 28 then Renders a red line between points (56, 175) and (361, 128).
; PLAN: r0=379(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=110(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=56(x1), r11=175(y1), r12=361(x2), r13=128(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 110
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 56
LDI r11, 175
LDI r12, 361
LDI r13, 128
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
