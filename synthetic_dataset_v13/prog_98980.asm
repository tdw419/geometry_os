; DESCRIPTION: Composite: Places a red dot at position (271, 202) then Draws a orange rectangle at (182, 103) with width 47 and height 22.
; PLAN: r0=271(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=103(y), r7=47(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 202
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 182
LDI r6, 103
LDI r7, 47
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
