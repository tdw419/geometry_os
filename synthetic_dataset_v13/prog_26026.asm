; DESCRIPTION: Composite: Draws a green line from (268, 213) to (66, 50) then Renders a purple box of size 66x27 starting at (190, 58) then Places a red dot at position (371, 247).
; PLAN: r0=268(x1), r1=213(y1), r2=66(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=58(y), r7=66(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=247(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 213
LDI r2, 66
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 58
LDI r7, 66
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 247
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
