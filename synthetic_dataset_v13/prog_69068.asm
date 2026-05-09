; DESCRIPTION: Composite: Sets a single yellow pixel at (438, 46) then Places a magenta 113x22 rectangle at position (101, 40).
; PLAN: r0=438(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=40(y), r7=113(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 101
LDI r6, 40
LDI r7, 113
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
