; DESCRIPTION: Composite: Places a cyan circle of radius 67 at center (230, 91) then Places a blue 107x99 rectangle at position (284, 131).
; PLAN: r0=230(x), r1=91(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=131(y), r7=107(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 91
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 131
LDI r7, 107
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
