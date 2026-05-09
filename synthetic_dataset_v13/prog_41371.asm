; DESCRIPTION: Composite: Places a yellow line segment connecting (231, 18) to (245, 145) then Places a white 65x113 rectangle at position (338, 93).
; PLAN: r0=231(x1), r1=18(y1), r2=245(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=93(y), r7=65(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 18
LDI r2, 245
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 93
LDI r7, 65
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
