; DESCRIPTION: Composite: Places a magenta line segment connecting (72, 247) to (458, 64) then Places a magenta 16x35 rectangle at position (10, 99).
; PLAN: r0=72(x1), r1=247(y1), r2=458(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=99(y), r7=16(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 247
LDI r2, 458
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 99
LDI r7, 16
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
