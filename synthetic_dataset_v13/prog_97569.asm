; DESCRIPTION: Composite: Places a magenta 108x27 rectangle at position (365, 93) then Renders a purple disk with center (108, 173) and radius 55.
; PLAN: r0=365(x), r1=93(y), r2=108(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=173(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 93
LDI r2, 108
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 173
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
