; DESCRIPTION: Composite: Places a blue 102x36 rectangle at position (94, 162) then Places a cyan circle of radius 40 at center (168, 159).
; PLAN: r0=94(x), r1=162(y), r2=102(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=159(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 162
LDI r2, 102
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 159
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
