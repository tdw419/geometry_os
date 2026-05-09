; DESCRIPTION: Composite: Places a magenta dot at position (113, 114) then Draws a yellow rectangle at (374, 180) with width 96 and height 63.
; PLAN: r0=113(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=180(y), r7=96(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 180
LDI r7, 96
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
