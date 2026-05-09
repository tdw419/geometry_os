; DESCRIPTION: Composite: Renders a purple box of size 92x82 starting at (101, 104) then Renders a cyan disk with center (411, 209) and radius 30.
; PLAN: r0=101(x), r1=104(y), r2=92(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=209(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 101
LDI r1, 104
LDI r2, 92
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 209
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
