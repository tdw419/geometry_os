; DESCRIPTION: Composite: Places a red 111x28 rectangle at position (55, 192) then Places a blue line segment connecting (92, 199) to (146, 102).
; PLAN: r0=55(x), r1=192(y), r2=111(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=199(y1), r7=146(x2), r8=102(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 192
LDI r2, 111
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 199
LDI r7, 146
LDI r8, 102
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
