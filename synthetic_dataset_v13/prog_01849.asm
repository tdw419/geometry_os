; DESCRIPTION: Composite: Draws a orange line from (381, 61) to (399, 23) then Renders a cyan box of size 14x36 starting at (202, 14).
; PLAN: r0=381(x1), r1=61(y1), r2=399(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=14(y), r7=14(width), r8=36(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 61
LDI r2, 399
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 14
LDI r7, 14
LDI r8, 36
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
