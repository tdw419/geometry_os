; DESCRIPTION: Composite: Creates a green circular shape at (481, 164) with radius 19 then Renders a white line between points (305, 86) and (442, 61) then Sets a single white pixel at (173, 211).
; PLAN: r0=481(x), r1=164(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=86(y1), r7=442(x2), r8=61(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=173(x), r11=211(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 481
LDI r1, 164
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 86
LDI r7, 442
LDI r8, 61
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 211
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
