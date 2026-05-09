; DESCRIPTION: Composite: Places a magenta 115x17 rectangle at position (126, 36) then Places a green line segment connecting (371, 180) to (354, 51).
; PLAN: r0=126(x), r1=36(y), r2=115(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=180(y1), r7=354(x2), r8=51(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 36
LDI r2, 115
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 180
LDI r7, 354
LDI r8, 51
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
