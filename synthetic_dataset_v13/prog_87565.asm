; DESCRIPTION: Composite: Places a yellow 118x68 rectangle at position (171, 120) then Places a purple dot at position (264, 226) then Renders a cyan disk with center (431, 108) and radius 44.
; PLAN: r0=171(x), r1=120(y), r2=118(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=226(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=108(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 120
LDI r2, 118
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 226
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 108
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
