; DESCRIPTION: Composite: Sets a single cyan pixel at (365, 226) then Creates a black rectangular region at (303, 133) spanning 42 by 19 pixels then Creates a purple circular shape at (428, 70) with radius 70.
; PLAN: r0=365(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=133(y), r7=42(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=70(y), r12=70(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 133
LDI r7, 42
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 70
LDI r12, 70
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
