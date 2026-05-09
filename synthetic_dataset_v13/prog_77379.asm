; DESCRIPTION: Composite: Draws a blue line from (244, 128) to (60, 59) then Places a black circle of radius 37 at center (168, 166) then Places a cyan dot at position (294, 80).
; PLAN: r0=244(x1), r1=128(y1), r2=60(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=166(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x), r11=80(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 128
LDI r2, 60
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 166
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 80
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
