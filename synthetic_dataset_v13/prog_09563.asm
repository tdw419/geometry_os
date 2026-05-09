; DESCRIPTION: Composite: Renders a blue line between points (167, 215) and (480, 70) then Creates a white rectangular region at (296, 161) spanning 75 by 34 pixels.
; PLAN: r0=167(x1), r1=215(y1), r2=480(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=161(y), r7=75(width), r8=34(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 215
LDI r2, 480
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 161
LDI r7, 75
LDI r8, 34
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
