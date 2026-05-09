; DESCRIPTION: Places a cyan 113x59 rectangle at position (233, 100).
; PLAN: r0=233(x), r1=100(y), r2=113(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 100
LDI r2, 113
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
