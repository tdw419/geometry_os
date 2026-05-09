; DESCRIPTION: Composite: Draws a blue line from (171, 32) to (479, 60) then Draws a white rectangle at (238, 142) with width 66 and height 109.
; PLAN: r0=171(x1), r1=32(y1), r2=479(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=142(y), r7=66(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 32
LDI r2, 479
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 142
LDI r7, 66
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
