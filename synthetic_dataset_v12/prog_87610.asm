; DESCRIPTION: Composite: Places a green 29x51 rectangle at position (135, 111) then Places a red line segment connecting (55, 189) to (174, 221).
; PLAN: r0=135(x), r1=111(y), r2=29(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x1), r6=189(y1), r7=174(x2), r8=221(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 111
LDI r2, 29
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 189
LDI r7, 174
LDI r8, 221
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
