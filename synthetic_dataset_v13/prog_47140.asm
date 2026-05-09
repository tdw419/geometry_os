; DESCRIPTION: Composite: Sets a single magenta pixel at (207, 228) then Renders a orange box of size 20x52 starting at (472, 197).
; PLAN: r0=207(x), r1=228(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=472(x), r6=197(y), r7=20(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 228
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 472
LDI r6, 197
LDI r7, 20
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
