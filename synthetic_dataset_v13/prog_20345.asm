; DESCRIPTION: Composite: Renders a yellow box of size 94x44 starting at (101, 72) then Draws a cyan line from (119, 245) to (481, 222) then Places a red dot at position (499, 208).
; PLAN: r0=101(x), r1=72(y), r2=94(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=245(y1), r7=481(x2), r8=222(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=499(x), r11=208(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 72
LDI r2, 94
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 245
LDI r7, 481
LDI r8, 222
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 208
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
