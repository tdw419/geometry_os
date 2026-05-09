; DESCRIPTION: Composite: Sets a single purple pixel at (352, 12) then Renders a orange box of size 56x107 starting at (193, 7) then Places a magenta circle of radius 40 at center (69, 57).
; PLAN: r0=352(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=7(y), r7=56(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=57(y), r12=40(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 12
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 7
LDI r7, 56
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 57
LDI r12, 40
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
