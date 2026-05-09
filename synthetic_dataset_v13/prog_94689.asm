; DESCRIPTION: Composite: Places a orange 31x38 rectangle at position (225, 100) then Renders a blue line between points (75, 18) and (367, 166).
; PLAN: r0=225(x), r1=100(y), r2=31(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=18(y1), r7=367(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 100
LDI r2, 31
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 18
LDI r7, 367
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
