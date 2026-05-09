; DESCRIPTION: Composite: Places a blue 58x65 rectangle at position (10, 181) then Places a red line segment connecting (112, 96) to (164, 64).
; PLAN: r0=10(x), r1=181(y), r2=58(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x1), r6=96(y1), r7=164(x2), r8=64(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 181
LDI r2, 58
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 96
LDI r7, 164
LDI r8, 64
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
