; DESCRIPTION: Composite: Sets a single cyan pixel at (450, 125) then Creates a orange rectangular region at (300, 105) spanning 44 by 70 pixels.
; PLAN: r0=450(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=105(y), r7=44(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 300
LDI r6, 105
LDI r7, 44
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
