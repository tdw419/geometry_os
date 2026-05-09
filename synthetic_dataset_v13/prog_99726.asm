; DESCRIPTION: Composite: Places a green 47x40 rectangle at position (29, 53) then Places a green circle of radius 74 at center (236, 174).
; PLAN: r0=29(x), r1=53(y), r2=47(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=174(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 53
LDI r2, 47
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 174
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
