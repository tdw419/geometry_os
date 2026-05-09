; DESCRIPTION: Composite: Places a magenta circle of radius 34 at center (52, 117) then Places a yellow 97x16 rectangle at position (236, 216).
; PLAN: r0=52(x), r1=117(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=216(y), r7=97(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 117
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 216
LDI r7, 97
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
