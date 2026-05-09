; DESCRIPTION: Places a magenta 55x104 rectangle at position (173, 20).
; PLAN: r0=173(x), r1=20(y), r2=55(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 20
LDI r2, 55
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
