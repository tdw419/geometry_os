; DESCRIPTION: Composite: Creates a green circular shape at (268, 66) with radius 37 then Places a cyan dot at position (162, 34) then Draws a magenta line from (104, 36) to (486, 16).
; PLAN: r0=268(x), r1=66(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=34(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=104(x1), r11=36(y1), r12=486(x2), r13=16(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 66
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 34
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 104
LDI r11, 36
LDI r12, 486
LDI r13, 16
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
