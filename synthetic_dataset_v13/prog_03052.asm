; DESCRIPTION: Composite: Creates a black rectangular region at (318, 10) spanning 34 by 55 pixels then Draws a cyan line from (245, 52) to (39, 216) then Places a magenta dot at position (193, 60).
; PLAN: r0=318(x), r1=10(y), r2=34(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x1), r6=52(y1), r7=39(x2), r8=216(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=60(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 10
LDI r2, 34
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 52
LDI r7, 39
LDI r8, 216
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 60
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
