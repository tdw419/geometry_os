; DESCRIPTION: Composite: Places a blue circle of radius 47 at center (307, 90) then Places a yellow 91x67 rectangle at position (223, 16).
; PLAN: r0=307(x), r1=90(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=16(y), r7=91(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 90
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 16
LDI r7, 91
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
