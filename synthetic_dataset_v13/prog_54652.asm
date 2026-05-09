; DESCRIPTION: Composite: Draws a red rectangle at (111, 21) with width 61 and height 99 then Draws a cyan circle centered at (337, 120) with radius 10.
; PLAN: r0=111(x), r1=21(y), r2=61(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=120(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 21
LDI r2, 61
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 120
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
