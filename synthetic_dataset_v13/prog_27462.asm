; DESCRIPTION: Composite: Creates a orange circular shape at (224, 186) with radius 52 then Places a cyan dot at position (256, 202) then Renders a cyan line between points (409, 49) and (257, 143).
; PLAN: r0=224(x), r1=186(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=202(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=409(x1), r11=49(y1), r12=257(x2), r13=143(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 186
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 202
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 409
LDI r11, 49
LDI r12, 257
LDI r13, 143
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
