; DESCRIPTION: Places a blue 109x22 rectangle at position (294, 1).
; PLAN: r0=294(x), r1=1(y), r2=109(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 1
LDI r2, 109
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
