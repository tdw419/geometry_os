; DESCRIPTION: Composite: Places a cyan dot at position (403, 57) then Places a white 58x52 rectangle at position (443, 201) then Creates a yellow circular shape at (489, 223) with radius 20.
; PLAN: r0=403(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=201(y), r7=58(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x), r11=223(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 443
LDI r6, 201
LDI r7, 58
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 223
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
