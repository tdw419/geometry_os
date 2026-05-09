; DESCRIPTION: Composite: Renders a orange disk with center (371, 216) and radius 16 then Creates a magenta rectangular region at (197, 2) spanning 111 by 27 pixels.
; PLAN: r0=371(x), r1=216(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=2(y), r7=111(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 216
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 2
LDI r7, 111
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
