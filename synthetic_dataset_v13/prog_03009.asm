; DESCRIPTION: Places a cyan 61x69 rectangle at position (362, 173).
; PLAN: r0=362(x), r1=173(y), r2=61(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 173
LDI r2, 61
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
