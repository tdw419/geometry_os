; DESCRIPTION: Composite: Draws a yellow line from (395, 2) to (225, 253) then Places a white 111x92 rectangle at position (174, 7).
; PLAN: r0=395(x1), r1=2(y1), r2=225(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=7(y), r7=111(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 2
LDI r2, 225
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 7
LDI r7, 111
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
