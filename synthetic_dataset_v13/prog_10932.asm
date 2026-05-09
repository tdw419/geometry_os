; DESCRIPTION: Composite: Renders a magenta box of size 92x68 starting at (362, 29) then Places a orange dot at position (144, 101).
; PLAN: r0=362(x), r1=29(y), r2=92(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=101(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 29
LDI r2, 92
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 101
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
