; DESCRIPTION: Places a red 71x116 rectangle at position (229, 73).
; PLAN: r0=229(x), r1=73(y), r2=71(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 73
LDI r2, 71
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
