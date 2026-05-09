; DESCRIPTION: Composite: Sets a single magenta pixel at (84, 146) then Renders a white box of size 54x54 starting at (81, 181).
; PLAN: r0=84(x), r1=146(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=181(y), r7=54(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 146
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 181
LDI r7, 54
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
