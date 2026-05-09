; DESCRIPTION: Composite: Places a yellow dot at position (335, 2) then Creates a orange rectangular region at (450, 52) spanning 60 by 100 pixels.
; PLAN: r0=335(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=52(y), r7=60(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 450
LDI r6, 52
LDI r7, 60
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
