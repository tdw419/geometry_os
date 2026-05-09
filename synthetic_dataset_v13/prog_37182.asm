; DESCRIPTION: Composite: Sets a single green pixel at (300, 24) then Renders a orange box of size 12x102 starting at (303, 62).
; PLAN: r0=300(x), r1=24(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=62(y), r7=12(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 24
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 303
LDI r6, 62
LDI r7, 12
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
