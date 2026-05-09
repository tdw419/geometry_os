; DESCRIPTION: Composite: Places a cyan circle of radius 29 at center (168, 193) then Draws a green rectangle at (51, 57) with width 94 and height 96.
; PLAN: r0=168(x), r1=193(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=57(y), r7=94(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 193
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 57
LDI r7, 94
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
