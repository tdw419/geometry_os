; DESCRIPTION: Places a red 16x116 rectangle at position (420, 14).
; PLAN: r0=420(x), r1=14(y), r2=16(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 14
LDI r2, 16
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
