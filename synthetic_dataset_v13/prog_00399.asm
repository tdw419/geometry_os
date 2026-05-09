; DESCRIPTION: Places a red 116x64 rectangle at position (149, 55).
; PLAN: r0=149(x), r1=55(y), r2=116(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 55
LDI r2, 116
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
