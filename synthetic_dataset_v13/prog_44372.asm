; DESCRIPTION: Composite: Renders a black line between points (55, 128) and (62, 59) then Places a blue 56x58 rectangle at position (171, 125).
; PLAN: r0=55(x1), r1=128(y1), r2=62(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=125(y), r7=56(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 128
LDI r2, 62
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 125
LDI r7, 56
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
