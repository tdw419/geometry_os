; DESCRIPTION: Composite: Places a orange line segment connecting (276, 226) to (243, 126) then Places a green 94x66 rectangle at position (301, 130).
; PLAN: r0=276(x1), r1=226(y1), r2=243(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=130(y), r7=94(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 226
LDI r2, 243
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 130
LDI r7, 94
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
