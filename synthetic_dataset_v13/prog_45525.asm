; DESCRIPTION: Composite: Draws a orange line from (124, 42) to (149, 33) then Renders a cyan box of size 86x34 starting at (263, 110).
; PLAN: r0=124(x1), r1=42(y1), r2=149(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=110(y), r7=86(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 42
LDI r2, 149
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 110
LDI r7, 86
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
