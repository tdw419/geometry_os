; DESCRIPTION: Composite: Places a cyan dot at position (251, 45) then Places a orange circle of radius 75 at center (411, 114) then Renders a magenta line between points (114, 231) and (456, 32).
; PLAN: r0=251(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=114(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=114(x1), r11=231(y1), r12=456(x2), r13=32(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 114
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 114
LDI r11, 231
LDI r12, 456
LDI r13, 32
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
