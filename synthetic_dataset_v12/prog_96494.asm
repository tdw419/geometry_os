; DESCRIPTION: Composite: Creates a cyan circular shape at (308, 163) with radius 33 then Places a yellow line segment connecting (480, 214) to (271, 76) then Sets a single orange pixel at (40, 0).
; PLAN: r0=308(x), r1=163(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x1), r6=214(y1), r7=271(x2), r8=76(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=0(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 163
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 214
LDI r7, 271
LDI r8, 76
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 0
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
