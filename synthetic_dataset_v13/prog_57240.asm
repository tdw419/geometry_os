; DESCRIPTION: Composite: Renders a cyan box of size 25x67 starting at (114, 144) then Places a blue circle of radius 64 at center (350, 191).
; PLAN: r0=114(x), r1=144(y), r2=25(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=191(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 144
LDI r2, 25
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 191
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
