; DESCRIPTION: Composite: Draws a cyan circle centered at (392, 168) with radius 79 then Places a green 19x108 rectangle at position (437, 17).
; PLAN: r0=392(x), r1=168(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=17(y), r7=19(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 168
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 17
LDI r7, 19
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
