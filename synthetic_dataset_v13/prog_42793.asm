; DESCRIPTION: Composite: Sets a single purple pixel at (426, 206) then Renders a orange box of size 103x56 starting at (123, 169).
; PLAN: r0=426(x), r1=206(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=169(y), r7=103(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 206
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 169
LDI r7, 103
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
