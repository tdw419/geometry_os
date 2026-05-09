; DESCRIPTION: Composite: Creates a cyan circular shape at (465, 65) with radius 39 then Renders a orange line between points (402, 207) and (382, 57) then Places a red dot at position (376, 174).
; PLAN: r0=465(x), r1=65(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=207(y1), r7=382(x2), r8=57(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=376(x), r11=174(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 65
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 207
LDI r7, 382
LDI r8, 57
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 174
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
