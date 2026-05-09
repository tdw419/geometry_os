; DESCRIPTION: Composite: Places a red circle of radius 63 at center (256, 153) then Draws a cyan rectangle at (367, 162) with width 74 and height 10.
; PLAN: r0=256(x), r1=153(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=162(y), r7=74(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 153
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 162
LDI r7, 74
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
