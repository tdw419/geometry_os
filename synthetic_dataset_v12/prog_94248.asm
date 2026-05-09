; DESCRIPTION: Composite: Places a green 40x68 rectangle at position (103, 21) then Places a magenta circle of radius 66 at center (288, 98).
; PLAN: r0=103(x), r1=21(y), r2=40(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=98(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 21
LDI r2, 40
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 98
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
