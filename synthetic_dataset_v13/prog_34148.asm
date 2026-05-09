; DESCRIPTION: Places a green 61x53 rectangle at position (239, 102).
; PLAN: r0=239(x), r1=102(y), r2=61(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 102
LDI r2, 61
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
