; DESCRIPTION: Places a cyan 31x116 rectangle at position (82, 58).
; PLAN: r0=82(x), r1=58(y), r2=31(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 58
LDI r2, 31
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
