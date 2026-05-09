; DESCRIPTION: Composite: Places a green 49x43 rectangle at position (218, 206) then Creates a cyan circular shape at (102, 132) with radius 78.
; PLAN: r0=218(x), r1=206(y), r2=49(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=132(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 206
LDI r2, 49
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 132
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
