; DESCRIPTION: Composite: Places a black line segment connecting (184, 140) to (44, 221) then Places a blue 108x28 rectangle at position (156, 138).
; PLAN: r0=184(x1), r1=140(y1), r2=44(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=138(y), r7=108(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 140
LDI r2, 44
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 138
LDI r7, 108
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
