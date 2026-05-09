; DESCRIPTION: Composite: Renders a white line between points (196, 74) and (214, 181) then Draws a blue rectangle at (401, 141) with width 105 and height 108.
; PLAN: r0=196(x1), r1=74(y1), r2=214(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=141(y), r7=105(width), r8=108(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 74
LDI r2, 214
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 141
LDI r7, 105
LDI r8, 108
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
