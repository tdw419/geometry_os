; DESCRIPTION: Composite: Places a magenta dot at position (180, 114) then Renders a white box of size 18x17 starting at (478, 193).
; PLAN: r0=180(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=193(y), r7=18(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 193
LDI r7, 18
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
