; DESCRIPTION: Composite: Renders a green box of size 24x32 starting at (109, 194) then Renders a purple disk with center (425, 163) and radius 66 then Places a cyan line segment connecting (497, 19) to (284, 116).
; PLAN: r0=109(x), r1=194(y), r2=24(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=163(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x1), r11=19(y1), r12=284(x2), r13=116(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 194
LDI r2, 24
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 163
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 19
LDI r12, 284
LDI r13, 116
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
