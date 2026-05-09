; DESCRIPTION: Composite: Places a yellow dot at position (265, 40) then Places a magenta 109x53 rectangle at position (362, 130).
; PLAN: r0=265(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=130(y), r7=109(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 362
LDI r6, 130
LDI r7, 109
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
