; DESCRIPTION: Composite: Places a green 117x67 rectangle at position (145, 25) then Places a green circle of radius 30 at center (358, 103).
; PLAN: r0=145(x), r1=25(y), r2=117(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=103(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 25
LDI r2, 117
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 103
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
