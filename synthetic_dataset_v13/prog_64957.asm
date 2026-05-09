; DESCRIPTION: Composite: Places a orange dot at position (130, 106) then Renders a red box of size 14x76 starting at (40, 47).
; PLAN: r0=130(x), r1=106(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=47(y), r7=14(width), r8=76(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 106
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 40
LDI r6, 47
LDI r7, 14
LDI r8, 76
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
