; DESCRIPTION: Places a magenta 10x32 rectangle at position (485, 5).
; PLAN: r0=485(x), r1=5(y), r2=10(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 5
LDI r2, 10
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
