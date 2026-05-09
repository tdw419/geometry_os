; DESCRIPTION: Composite: Places a red dot at position (74, 199) then Renders a magenta box of size 33x115 starting at (211, 113).
; PLAN: r0=74(x), r1=199(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=113(y), r7=33(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 199
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 211
LDI r6, 113
LDI r7, 33
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
