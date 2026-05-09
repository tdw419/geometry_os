; DESCRIPTION: Composite: Renders a blue box of size 54x12 starting at (268, 115) then Draws a black line from (299, 195) to (308, 228).
; PLAN: r0=268(x), r1=115(y), r2=54(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=195(y1), r7=308(x2), r8=228(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 115
LDI r2, 54
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 195
LDI r7, 308
LDI r8, 228
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
