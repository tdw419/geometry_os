; DESCRIPTION: Composite: Places a white dot at position (371, 93) then Renders a cyan box of size 103x73 starting at (393, 62) then Renders a green disk with center (216, 62) and radius 54.
; PLAN: r0=371(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=62(y), r7=103(width), r8=73(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=62(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 62
LDI r7, 103
LDI r8, 73
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 62
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
