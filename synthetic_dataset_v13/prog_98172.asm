; DESCRIPTION: Places a blue 21x28 rectangle at position (214, 172).
; PLAN: r0=214(x), r1=172(y), r2=21(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 172
LDI r2, 21
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
