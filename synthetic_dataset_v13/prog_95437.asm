; DESCRIPTION: Composite: Places a magenta 79x26 rectangle at position (90, 81) then Places a red dot at position (294, 150) then Renders a green disk with center (243, 19) and radius 12.
; PLAN: r0=90(x), r1=81(y), r2=79(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=150(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=19(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 81
LDI r2, 79
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 150
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 243
LDI r11, 19
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
