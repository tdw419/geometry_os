; DESCRIPTION: Composite: Draws a red line from (415, 62) to (487, 21) then Places a magenta 24x40 rectangle at position (462, 4).
; PLAN: r0=415(x1), r1=62(y1), r2=487(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=4(y), r7=24(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 62
LDI r2, 487
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 4
LDI r7, 24
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
