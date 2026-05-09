; DESCRIPTION: Composite: Renders a green box of size 80x112 starting at (116, 9) then Places a magenta dot at position (136, 126).
; PLAN: r0=116(x), r1=9(y), r2=80(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=126(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 9
LDI r2, 80
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 126
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
