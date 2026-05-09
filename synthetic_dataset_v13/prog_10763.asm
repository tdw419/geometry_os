; DESCRIPTION: Composite: Sets a single white pixel at (206, 215) then Places a magenta circle of radius 11 at center (180, 60) then Places a blue 64x47 rectangle at position (9, 173).
; PLAN: r0=206(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=60(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=9(x), r11=173(y), r12=64(width), r13=47(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 60
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 9
LDI r11, 173
LDI r12, 64
LDI r13, 47
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
