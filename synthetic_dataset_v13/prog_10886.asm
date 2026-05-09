; DESCRIPTION: Composite: Places a yellow dot at position (317, 149) then Renders a red box of size 18x97 starting at (296, 28) then Creates a cyan circular shape at (367, 200) with radius 28.
; PLAN: r0=317(x), r1=149(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=28(y), r7=18(width), r8=97(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=200(y), r12=28(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 149
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 296
LDI r6, 28
LDI r7, 18
LDI r8, 97
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 200
LDI r12, 28
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
