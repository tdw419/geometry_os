; DESCRIPTION: Composite: Draws a white line from (184, 164) to (238, 159) then Places a blue 56x55 rectangle at position (14, 113).
; PLAN: r0=184(x1), r1=164(y1), r2=238(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=113(y), r7=56(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 164
LDI r2, 238
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 113
LDI r7, 56
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
