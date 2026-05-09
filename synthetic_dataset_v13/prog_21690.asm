; DESCRIPTION: Places a yellow 61x102 rectangle at position (415, 103).
; PLAN: r0=415(x), r1=103(y), r2=61(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 103
LDI r2, 61
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
