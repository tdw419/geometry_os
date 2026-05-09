; DESCRIPTION: Composite: Sets a single green pixel at (339, 48) then Renders a green box of size 27x86 starting at (397, 65) then Places a blue line segment connecting (494, 47) to (397, 151).
; PLAN: r0=339(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=65(y), r7=27(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=494(x1), r11=47(y1), r12=397(x2), r13=151(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 397
LDI r6, 65
LDI r7, 27
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 47
LDI r12, 397
LDI r13, 151
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
