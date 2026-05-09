; DESCRIPTION: Composite: Draws a white line from (367, 79) to (482, 23) then Places a magenta 23x34 rectangle at position (289, 172).
; PLAN: r0=367(x1), r1=79(y1), r2=482(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=172(y), r7=23(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 79
LDI r2, 482
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 172
LDI r7, 23
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
