; DESCRIPTION: Composite: Places a purple dot at position (426, 173) then Draws a magenta rectangle at (406, 46) with width 54 and height 112.
; PLAN: r0=426(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=46(y), r7=54(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 46
LDI r7, 54
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
