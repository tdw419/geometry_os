; DESCRIPTION: Places a cyan 116x116 rectangle at position (150, 15).
; PLAN: r0=150(x), r1=15(y), r2=116(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 15
LDI r2, 116
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
