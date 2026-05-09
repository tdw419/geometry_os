; DESCRIPTION: Composite: Places a blue line segment connecting (473, 125) to (262, 243) then Renders a red box of size 70x103 starting at (232, 44).
; PLAN: r0=473(x1), r1=125(y1), r2=262(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=44(y), r7=70(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 125
LDI r2, 262
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 44
LDI r7, 70
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
