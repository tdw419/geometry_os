; DESCRIPTION: Composite: Renders a orange disk with center (276, 193) and radius 60 then Places a red dot at position (342, 129) then Places a cyan line segment connecting (146, 65) to (130, 110).
; PLAN: r0=276(x), r1=193(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=129(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=146(x1), r11=65(y1), r12=130(x2), r13=110(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 193
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 129
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 146
LDI r11, 65
LDI r12, 130
LDI r13, 110
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
