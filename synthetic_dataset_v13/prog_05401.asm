; DESCRIPTION: Composite: Places a orange dot at position (369, 30) then Renders a green disk with center (249, 50) and radius 13 then Renders a cyan line between points (394, 66) and (92, 161).
; PLAN: r0=369(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=50(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=66(y1), r12=92(x2), r13=161(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 249
LDI r6, 50
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 66
LDI r12, 92
LDI r13, 161
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
