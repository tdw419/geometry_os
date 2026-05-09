; DESCRIPTION: Composite: Places a cyan line segment connecting (288, 65) to (39, 117) then Renders a yellow disk with center (61, 85) and radius 23 then Places a orange dot at position (346, 40).
; PLAN: r0=288(x1), r1=65(y1), r2=39(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=85(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x), r11=40(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 65
LDI r2, 39
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 85
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 40
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
