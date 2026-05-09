; DESCRIPTION: Composite: Draws a white line from (80, 247) to (127, 39) then Places a black 69x28 rectangle at position (15, 102).
; PLAN: r0=80(x1), r1=247(y1), r2=127(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=102(y), r7=69(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 247
LDI r2, 127
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 102
LDI r7, 69
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
