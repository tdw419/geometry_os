; DESCRIPTION: Composite: Renders a magenta box of size 103x27 starting at (408, 98) then Places a blue dot at position (75, 163).
; PLAN: r0=408(x), r1=98(y), r2=103(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=163(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 98
LDI r2, 103
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 163
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
