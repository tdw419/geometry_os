; DESCRIPTION: Places a blue 27x48 rectangle at position (116, 73).
; PLAN: r0=116(x), r1=73(y), r2=27(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 73
LDI r2, 27
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
