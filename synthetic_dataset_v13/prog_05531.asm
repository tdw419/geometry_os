; DESCRIPTION: Composite: Draws a magenta line from (205, 3) to (59, 43) then Sets a single cyan pixel at (367, 132) then Places a green 10x56 rectangle at position (126, 164).
; PLAN: r0=205(x1), r1=3(y1), r2=59(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=132(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=164(y), r12=10(width), r13=56(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 3
LDI r2, 59
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 132
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 164
LDI r12, 10
LDI r13, 56
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
