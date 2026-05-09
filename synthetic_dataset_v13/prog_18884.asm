; DESCRIPTION: Composite: Places a magenta circle of radius 31 at center (474, 205) then Renders a magenta box of size 95x54 starting at (113, 52).
; PLAN: r0=474(x), r1=205(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=52(y), r7=95(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 474
LDI r1, 205
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 52
LDI r7, 95
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
