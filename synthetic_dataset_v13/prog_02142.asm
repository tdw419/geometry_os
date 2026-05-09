; DESCRIPTION: Places a green 102x116 rectangle at position (265, 14).
; PLAN: r0=265(x), r1=14(y), r2=102(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 14
LDI r2, 102
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
