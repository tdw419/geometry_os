; DESCRIPTION: Composite: Renders a blue disk with center (299, 146) and radius 44 then Renders a cyan box of size 29x62 starting at (371, 153).
; PLAN: r0=299(x), r1=146(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=153(y), r7=29(width), r8=62(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 146
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 153
LDI r7, 29
LDI r8, 62
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
