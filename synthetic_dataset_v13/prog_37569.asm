; DESCRIPTION: Composite: Places a yellow 18x95 rectangle at position (382, 3) then Renders a yellow disk with center (197, 197) and radius 33.
; PLAN: r0=382(x), r1=3(y), r2=18(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=197(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 382
LDI r1, 3
LDI r2, 18
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 197
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
