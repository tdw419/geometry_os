; DESCRIPTION: Composite: Places a black circle of radius 70 at center (70, 132) then Renders a purple box of size 92x107 starting at (92, 42).
; PLAN: r0=70(x), r1=132(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=42(y), r7=92(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 132
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 42
LDI r7, 92
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
