; DESCRIPTION: Composite: Places a magenta dot at position (62, 226) then Renders a blue box of size 17x44 starting at (324, 184).
; PLAN: r0=62(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=184(y), r7=17(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 184
LDI r7, 17
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
