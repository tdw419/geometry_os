; DESCRIPTION: Places a cyan 28x114 rectangle at position (260, 42).
; PLAN: r0=260(x), r1=42(y), r2=28(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 42
LDI r2, 28
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
