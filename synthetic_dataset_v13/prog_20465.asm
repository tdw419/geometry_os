; DESCRIPTION: Composite: Draws a white line from (402, 28) to (356, 44) then Draws a red rectangle at (115, 143) with width 104 and height 104 then Places a purple dot at position (189, 46).
; PLAN: r0=402(x1), r1=28(y1), r2=356(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=143(y), r7=104(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x), r11=46(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 28
LDI r2, 356
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 143
LDI r7, 104
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 46
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
