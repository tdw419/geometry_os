; DESCRIPTION: Composite: Renders a purple box of size 119x35 starting at (382, 199) then Places a orange dot at position (275, 60) then Draws a cyan line from (68, 239) to (139, 0).
; PLAN: r0=382(x), r1=199(y), r2=119(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=68(x1), r11=239(y1), r12=139(x2), r13=0(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 199
LDI r2, 119
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 68
LDI r11, 239
LDI r12, 139
LDI r13, 0
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
