; DESCRIPTION: Composite: Renders a blue disk with center (495, 90) and radius 14 then Renders a red box of size 113x109 starting at (202, 135).
; PLAN: r0=495(x), r1=90(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=135(y), r7=113(width), r8=109(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 90
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 135
LDI r7, 113
LDI r8, 109
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
