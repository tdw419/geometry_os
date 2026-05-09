; DESCRIPTION: Composite: Sets a single cyan pixel at (260, 221) then Draws a white circle centered at (89, 129) with radius 48 then Draws a magenta line from (244, 37) to (457, 119).
; PLAN: r0=260(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=129(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=244(x1), r11=37(y1), r12=457(x2), r13=119(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 129
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 244
LDI r11, 37
LDI r12, 457
LDI r13, 119
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
