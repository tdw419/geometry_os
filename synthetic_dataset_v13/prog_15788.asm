; DESCRIPTION: Composite: Sets a single red pixel at (386, 18) then Renders a magenta box of size 69x56 starting at (425, 166) then Draws a cyan circle centered at (111, 111) with radius 68.
; PLAN: r0=386(x), r1=18(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=166(y), r7=69(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=111(y), r12=68(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 18
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 425
LDI r6, 166
LDI r7, 69
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 111
LDI r12, 68
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
