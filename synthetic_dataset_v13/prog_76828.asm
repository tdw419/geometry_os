; DESCRIPTION: Composite: Places a green 87x108 rectangle at position (274, 63) then Draws a black line from (449, 228) to (18, 38).
; PLAN: r0=274(x), r1=63(y), r2=87(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x1), r6=228(y1), r7=18(x2), r8=38(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 63
LDI r2, 87
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 228
LDI r7, 18
LDI r8, 38
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
