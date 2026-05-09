; DESCRIPTION: Composite: Places a green 21x109 rectangle at position (426, 103) then Renders a purple disk with center (424, 116) and radius 42.
; PLAN: r0=426(x), r1=103(y), r2=21(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=116(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 103
LDI r2, 21
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 116
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
