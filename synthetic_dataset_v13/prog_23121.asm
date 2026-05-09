; DESCRIPTION: Composite: Places a magenta circle of radius 33 at center (301, 115) then Renders a white box of size 36x53 starting at (362, 82).
; PLAN: r0=301(x), r1=115(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=82(y), r7=36(width), r8=53(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 115
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 82
LDI r7, 36
LDI r8, 53
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
