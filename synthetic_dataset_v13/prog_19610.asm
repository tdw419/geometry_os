; DESCRIPTION: Composite: Creates a white rectangular region at (5, 180) spanning 16 by 70 pixels then Places a orange dot at position (278, 37) then Places a cyan line segment connecting (336, 29) to (433, 89).
; PLAN: r0=5(x), r1=180(y), r2=16(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=37(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=336(x1), r11=29(y1), r12=433(x2), r13=89(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 180
LDI r2, 16
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 37
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 336
LDI r11, 29
LDI r12, 433
LDI r13, 89
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
