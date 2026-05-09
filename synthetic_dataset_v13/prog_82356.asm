; DESCRIPTION: Composite: Sets a single purple pixel at (148, 148) then Renders a orange box of size 89x71 starting at (346, 134).
; PLAN: r0=148(x), r1=148(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=134(y), r7=89(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 148
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 134
LDI r7, 89
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
