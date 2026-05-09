; DESCRIPTION: Places a cyan 88x116 rectangle at position (294, 87).
; PLAN: r0=294(x), r1=87(y), r2=88(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 87
LDI r2, 88
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
