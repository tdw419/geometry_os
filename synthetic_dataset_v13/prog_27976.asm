; DESCRIPTION: Composite: Places a magenta dot at position (355, 243) then Draws a yellow rectangle at (114, 38) with width 19 and height 115.
; PLAN: r0=355(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=38(y), r7=19(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 243
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 38
LDI r7, 19
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
