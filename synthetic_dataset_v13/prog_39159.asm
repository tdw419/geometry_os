; DESCRIPTION: Composite: Renders a orange line between points (242, 201) and (114, 5) then Draws a cyan circle centered at (413, 92) with radius 42 then Places a green dot at position (271, 19).
; PLAN: r0=242(x1), r1=201(y1), r2=114(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=92(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=19(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 201
LDI r2, 114
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 92
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 19
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
