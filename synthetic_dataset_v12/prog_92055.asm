; DESCRIPTION: Composite: Draws a blue line from (98, 93) to (18, 201) then Places a magenta 61x27 rectangle at position (370, 40).
; PLAN: r0=98(x1), r1=93(y1), r2=18(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=40(y), r7=61(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 93
LDI r2, 18
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 40
LDI r7, 61
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
