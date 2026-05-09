; DESCRIPTION: Composite: Renders a blue line between points (348, 19) and (62, 197) then Places a green 40x40 rectangle at position (383, 209).
; PLAN: r0=348(x1), r1=19(y1), r2=62(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=209(y), r7=40(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 19
LDI r2, 62
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 209
LDI r7, 40
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
