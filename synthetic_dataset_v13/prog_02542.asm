; DESCRIPTION: Composite: Places a magenta line segment connecting (511, 42) to (397, 73) then Draws a cyan rectangle at (200, 58) with width 100 and height 61.
; PLAN: r0=511(x1), r1=42(y1), r2=397(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=58(y), r7=100(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 42
LDI r2, 397
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 58
LDI r7, 100
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
