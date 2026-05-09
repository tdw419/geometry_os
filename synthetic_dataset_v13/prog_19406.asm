; DESCRIPTION: Composite: Renders a red box of size 103x87 starting at (108, 126) then Places a magenta circle of radius 79 at center (198, 94).
; PLAN: r0=108(x), r1=126(y), r2=103(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=94(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 126
LDI r2, 103
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 94
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
