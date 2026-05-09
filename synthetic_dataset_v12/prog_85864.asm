; DESCRIPTION: Composite: Sets a single green pixel at (377, 120) then Creates a orange rectangular region at (411, 209) spanning 58 by 40 pixels.
; PLAN: r0=377(x), r1=120(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=209(y), r7=58(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 120
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 411
LDI r6, 209
LDI r7, 58
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
