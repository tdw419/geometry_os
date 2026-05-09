; DESCRIPTION: Composite: Renders a red box of size 65x54 starting at (384, 124) then Places a magenta circle of radius 65 at center (160, 175).
; PLAN: r0=384(x), r1=124(y), r2=65(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=175(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 124
LDI r2, 65
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 175
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
