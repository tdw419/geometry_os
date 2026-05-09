; DESCRIPTION: Composite: Places a red circle of radius 53 at center (248, 53) then Renders a yellow box of size 69x71 starting at (392, 110).
; PLAN: r0=248(x), r1=53(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=110(y), r7=69(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 53
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 110
LDI r7, 69
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
