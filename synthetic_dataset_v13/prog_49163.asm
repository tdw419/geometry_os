; DESCRIPTION: Places a black 71x116 rectangle at position (173, 91).
; PLAN: r0=173(x), r1=91(y), r2=71(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 91
LDI r2, 71
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
