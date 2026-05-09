; DESCRIPTION: Composite: Sets a single magenta pixel at (511, 146) then Draws a green rectangle at (133, 189) with width 74 and height 63.
; PLAN: r0=511(x), r1=146(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=189(y), r7=74(width), r8=63(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 146
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 189
LDI r7, 74
LDI r8, 63
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
