; DESCRIPTION: Places a cyan 59x116 rectangle at position (341, 8).
; PLAN: r0=341(x), r1=8(y), r2=59(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 8
LDI r2, 59
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
