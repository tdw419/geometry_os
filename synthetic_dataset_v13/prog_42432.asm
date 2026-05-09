; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (46, 188) then Creates a cyan rectangular region at (394, 97) spanning 48 by 110 pixels then Sets a single yellow pixel at (440, 132).
; PLAN: r0=46(x), r1=188(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=97(y), r7=48(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x), r11=132(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 188
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 97
LDI r7, 48
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 132
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
