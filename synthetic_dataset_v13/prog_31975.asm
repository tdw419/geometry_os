; DESCRIPTION: Composite: Renders a orange box of size 74x68 starting at (247, 120) then Places a blue circle of radius 19 at center (349, 161).
; PLAN: r0=247(x), r1=120(y), r2=74(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=161(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 120
LDI r2, 74
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 161
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
