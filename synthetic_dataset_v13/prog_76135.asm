; DESCRIPTION: Composite: Places a red dot at position (436, 75) then Renders a orange box of size 113x53 starting at (3, 154).
; PLAN: r0=436(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=154(y), r7=113(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 3
LDI r6, 154
LDI r7, 113
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
