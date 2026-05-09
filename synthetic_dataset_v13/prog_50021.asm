; DESCRIPTION: Places a black 32x55 rectangle at position (71, 68).
; PLAN: r0=71(x), r1=68(y), r2=32(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 68
LDI r2, 32
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
