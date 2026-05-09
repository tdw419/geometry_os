; DESCRIPTION: Composite: Creates a red rectangular region at (263, 55) spanning 27 by 60 pixels then Renders a green disk with center (400, 173) and radius 64.
; PLAN: r0=263(x), r1=55(y), r2=27(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=173(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 55
LDI r2, 27
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 173
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
