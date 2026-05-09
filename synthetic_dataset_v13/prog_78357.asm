; DESCRIPTION: Composite: Sets a single magenta pixel at (82, 240) then Draws a yellow rectangle at (346, 134) with width 86 and height 77.
; PLAN: r0=82(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=134(y), r7=86(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 134
LDI r7, 86
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
