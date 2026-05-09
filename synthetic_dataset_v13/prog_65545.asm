; DESCRIPTION: Places a magenta 71x32 rectangle at position (340, 68).
; PLAN: r0=340(x), r1=68(y), r2=71(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 68
LDI r2, 71
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
