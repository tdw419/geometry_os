; DESCRIPTION: Composite: Places a blue line segment connecting (157, 132) to (492, 95) then Places a black 42x100 rectangle at position (259, 134).
; PLAN: r0=157(x1), r1=132(y1), r2=492(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=134(y), r7=42(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 132
LDI r2, 492
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 134
LDI r7, 42
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
