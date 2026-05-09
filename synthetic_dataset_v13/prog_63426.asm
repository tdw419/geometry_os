; DESCRIPTION: Composite: Places a magenta 73x99 rectangle at position (212, 85) then Places a magenta line segment connecting (74, 174) to (401, 58).
; PLAN: r0=212(x), r1=85(y), r2=73(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=174(y1), r7=401(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 85
LDI r2, 73
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 174
LDI r7, 401
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
