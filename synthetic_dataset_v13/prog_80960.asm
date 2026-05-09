; DESCRIPTION: Composite: Renders a black box of size 61x74 starting at (347, 50) then Places a yellow line segment connecting (481, 130) to (394, 133).
; PLAN: r0=347(x), r1=50(y), r2=61(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=130(y1), r7=394(x2), r8=133(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 50
LDI r2, 61
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 130
LDI r7, 394
LDI r8, 133
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
