; DESCRIPTION: Composite: Draws a white rectangle at (346, 4) with width 38 and height 44 then Renders a cyan disk with center (197, 86) and radius 73.
; PLAN: r0=346(x), r1=4(y), r2=38(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=86(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 4
LDI r2, 38
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 86
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
