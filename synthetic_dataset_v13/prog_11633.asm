; DESCRIPTION: Composite: Renders a red line between points (59, 178) and (240, 138) then Places a white 77x91 rectangle at position (297, 162).
; PLAN: r0=59(x1), r1=178(y1), r2=240(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=162(y), r7=77(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 178
LDI r2, 240
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 162
LDI r7, 77
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
