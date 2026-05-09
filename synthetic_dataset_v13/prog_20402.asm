; DESCRIPTION: Composite: Renders a cyan box of size 93x63 starting at (86, 61) then Draws a black line from (11, 14) to (278, 174).
; PLAN: r0=86(x), r1=61(y), r2=93(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=14(y1), r7=278(x2), r8=174(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 61
LDI r2, 93
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 14
LDI r7, 278
LDI r8, 174
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
