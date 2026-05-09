; DESCRIPTION: Places a cyan 28x109 rectangle at position (456, 61).
; PLAN: r0=456(x), r1=61(y), r2=28(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 61
LDI r2, 28
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
