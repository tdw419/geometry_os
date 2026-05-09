; DESCRIPTION: Composite: Renders a magenta box of size 16x19 starting at (254, 42) then Places a orange line segment connecting (432, 114) to (70, 120).
; PLAN: r0=254(x), r1=42(y), r2=16(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=114(y1), r7=70(x2), r8=120(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 42
LDI r2, 16
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 114
LDI r7, 70
LDI r8, 120
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
