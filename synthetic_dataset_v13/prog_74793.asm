; DESCRIPTION: Places a cyan 103x114 rectangle at position (198, 48).
; PLAN: r0=198(x), r1=48(y), r2=103(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 48
LDI r2, 103
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
