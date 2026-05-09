; DESCRIPTION: Composite: Draws a green line from (135, 67) to (193, 103) then Places a yellow 66x42 rectangle at position (46, 99) then Places a black dot at position (412, 78).
; PLAN: r0=135(x1), r1=67(y1), r2=193(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=99(y), r7=66(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=78(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 67
LDI r2, 193
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 99
LDI r7, 66
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 78
LDI r12, 0x000000
PSET r10, r11, r12
HALT
