; DESCRIPTION: Composite: Sets a single orange pixel at (470, 84) then Renders a orange box of size 114x47 starting at (181, 161).
; PLAN: r0=470(x), r1=84(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=161(y), r7=114(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 84
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 181
LDI r6, 161
LDI r7, 114
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
