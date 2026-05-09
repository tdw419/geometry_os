; DESCRIPTION: Composite: Renders a cyan disk with center (464, 78) and radius 40 then Creates a orange rectangular region at (301, 79) spanning 49 by 106 pixels.
; PLAN: r0=464(x), r1=78(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=79(y), r7=49(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 78
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 79
LDI r7, 49
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
