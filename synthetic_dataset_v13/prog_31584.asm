; DESCRIPTION: Composite: Places a magenta 56x97 rectangle at position (437, 111) then Places a red line segment connecting (236, 226) to (202, 24).
; PLAN: r0=437(x), r1=111(y), r2=56(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=226(y1), r7=202(x2), r8=24(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 111
LDI r2, 56
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 226
LDI r7, 202
LDI r8, 24
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
