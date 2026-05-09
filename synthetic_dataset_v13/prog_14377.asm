; DESCRIPTION: Composite: Places a cyan circle of radius 59 at center (95, 148) then Creates a blue rectangular region at (6, 39) spanning 114 by 113 pixels.
; PLAN: r0=95(x), r1=148(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=39(y), r7=114(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 148
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 39
LDI r7, 114
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
