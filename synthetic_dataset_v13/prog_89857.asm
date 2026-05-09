; DESCRIPTION: Composite: Places a white dot at position (163, 77) then Renders a magenta box of size 85x53 starting at (132, 0).
; PLAN: r0=163(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=0(y), r7=85(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 0
LDI r7, 85
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
