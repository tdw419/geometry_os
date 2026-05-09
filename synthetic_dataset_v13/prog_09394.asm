; DESCRIPTION: Composite: Places a magenta 38x22 rectangle at position (430, 3) then Places a magenta dot at position (359, 13).
; PLAN: r0=430(x), r1=3(y), r2=38(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=13(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 430
LDI r1, 3
LDI r2, 38
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 13
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
