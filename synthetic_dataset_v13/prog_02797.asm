; DESCRIPTION: Composite: Renders a blue box of size 116x52 starting at (48, 152) then Places a white dot at position (337, 173).
; PLAN: r0=48(x), r1=152(y), r2=116(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 152
LDI r2, 116
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
