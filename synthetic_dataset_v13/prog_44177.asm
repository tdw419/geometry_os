; DESCRIPTION: Composite: Renders a orange box of size 59x63 starting at (157, 48) then Places a cyan dot at position (109, 6) then Places a purple line segment connecting (446, 220) to (73, 93).
; PLAN: r0=157(x), r1=48(y), r2=59(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=6(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=446(x1), r11=220(y1), r12=73(x2), r13=93(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 48
LDI r2, 59
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 6
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 446
LDI r11, 220
LDI r12, 73
LDI r13, 93
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
