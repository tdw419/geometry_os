; DESCRIPTION: Composite: Draws a magenta line from (326, 56) to (403, 11) then Places a cyan 101x56 rectangle at position (90, 5) then Places a green dot at position (490, 156).
; PLAN: r0=326(x1), r1=56(y1), r2=403(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=5(y), r7=101(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=490(x), r11=156(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 56
LDI r2, 403
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 5
LDI r7, 101
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 156
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
