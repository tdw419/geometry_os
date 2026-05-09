; DESCRIPTION: Composite: Places a blue 28x33 rectangle at position (395, 127) then Places a red line segment connecting (487, 96) to (54, 10).
; PLAN: r0=395(x), r1=127(y), r2=28(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x1), r6=96(y1), r7=54(x2), r8=10(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 127
LDI r2, 28
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 96
LDI r7, 54
LDI r8, 10
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
