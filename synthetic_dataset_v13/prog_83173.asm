; DESCRIPTION: Places a cyan 120x12 rectangle at position (59, 101).
; PLAN: r0=59(x), r1=101(y), r2=120(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 101
LDI r2, 120
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
