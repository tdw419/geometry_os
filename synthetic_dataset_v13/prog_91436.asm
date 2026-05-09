; DESCRIPTION: Composite: Creates a red circular shape at (202, 152) with radius 55 then Places a green line segment connecting (459, 12) to (86, 207) then Places a orange dot at position (197, 253).
; PLAN: r0=202(x), r1=152(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=12(y1), r7=86(x2), r8=207(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=253(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 152
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 12
LDI r7, 86
LDI r8, 207
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 253
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
