; DESCRIPTION: Composite: Places a blue line segment connecting (461, 206) to (42, 68) then Places a white 56x119 rectangle at position (191, 125).
; PLAN: r0=461(x1), r1=206(y1), r2=42(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=125(y), r7=56(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 206
LDI r2, 42
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 125
LDI r7, 56
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
