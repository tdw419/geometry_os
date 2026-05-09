; DESCRIPTION: Places a red 46x93 rectangle at position (464, 10).
; PLAN: r0=464(x), r1=10(y), r2=46(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 10
LDI r2, 46
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
