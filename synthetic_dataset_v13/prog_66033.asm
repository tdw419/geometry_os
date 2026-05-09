; DESCRIPTION: Composite: Places a blue circle of radius 52 at center (169, 144) then Creates a cyan rectangular region at (209, 2) spanning 71 by 85 pixels.
; PLAN: r0=169(x), r1=144(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=2(y), r7=71(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 144
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 2
LDI r7, 71
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
