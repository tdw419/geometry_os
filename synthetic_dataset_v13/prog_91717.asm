; DESCRIPTION: Composite: Places a cyan dot at position (494, 189) then Renders a magenta box of size 48x50 starting at (341, 181).
; PLAN: r0=494(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=181(y), r7=48(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 189
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 181
LDI r7, 48
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
