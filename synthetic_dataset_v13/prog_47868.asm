; DESCRIPTION: Composite: Places a red circle of radius 64 at center (302, 185) then Renders a yellow box of size 18x96 starting at (397, 46) then Renders a cyan line between points (456, 82) and (373, 134).
; PLAN: r0=302(x), r1=185(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=46(y), r7=18(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x1), r11=82(y1), r12=373(x2), r13=134(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 185
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 46
LDI r7, 18
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 82
LDI r12, 373
LDI r13, 134
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
