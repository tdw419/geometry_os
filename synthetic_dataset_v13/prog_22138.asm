; DESCRIPTION: Composite: Places a magenta circle of radius 25 at center (116, 229) then Places a green 53x87 rectangle at position (329, 57).
; PLAN: r0=116(x), r1=229(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=57(y), r7=53(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 229
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 57
LDI r7, 53
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
