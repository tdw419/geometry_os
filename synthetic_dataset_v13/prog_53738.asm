; DESCRIPTION: Composite: Renders a black box of size 120x32 starting at (29, 13) then Places a cyan circle of radius 75 at center (340, 138).
; PLAN: r0=29(x), r1=13(y), r2=120(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x), r6=138(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 13
LDI r2, 120
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 138
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
