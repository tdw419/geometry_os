; DESCRIPTION: Composite: Places a orange 55x63 rectangle at position (365, 183) then Places a orange line segment connecting (303, 186) to (340, 57).
; PLAN: r0=365(x), r1=183(y), r2=55(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x1), r6=186(y1), r7=340(x2), r8=57(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 183
LDI r2, 55
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 186
LDI r7, 340
LDI r8, 57
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
