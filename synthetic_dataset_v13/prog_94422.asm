; DESCRIPTION: Composite: Places a purple line segment connecting (247, 210) to (450, 189) then Places a yellow 117x39 rectangle at position (343, 120).
; PLAN: r0=247(x1), r1=210(y1), r2=450(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=120(y), r7=117(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 210
LDI r2, 450
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 120
LDI r7, 117
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
