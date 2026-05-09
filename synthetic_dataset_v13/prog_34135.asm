; DESCRIPTION: Places a green 61x53 rectangle at position (112, 82).
; PLAN: r0=112(x), r1=82(y), r2=61(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 82
LDI r2, 61
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
