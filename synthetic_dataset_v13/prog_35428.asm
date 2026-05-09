; DESCRIPTION: Composite: Places a orange line segment connecting (471, 6) to (410, 31) then Places a purple 120x112 rectangle at position (173, 131).
; PLAN: r0=471(x1), r1=6(y1), r2=410(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=131(y), r7=120(width), r8=112(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 6
LDI r2, 410
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 131
LDI r7, 120
LDI r8, 112
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
