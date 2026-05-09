; DESCRIPTION: Composite: Sets a single cyan pixel at (310, 168) then Creates a orange rectangular region at (108, 166) spanning 19 by 84 pixels.
; PLAN: r0=310(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=166(y), r7=19(width), r8=84(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 166
LDI r7, 19
LDI r8, 84
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
