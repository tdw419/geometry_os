; DESCRIPTION: Composite: Places a white line segment connecting (178, 73) to (492, 241) then Places a yellow 56x11 rectangle at position (125, 42).
; PLAN: r0=178(x1), r1=73(y1), r2=492(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=42(y), r7=56(width), r8=11(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 73
LDI r2, 492
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 42
LDI r7, 56
LDI r8, 11
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
