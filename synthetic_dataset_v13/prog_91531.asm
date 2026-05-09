; DESCRIPTION: Places a cyan 39x69 rectangle at position (58, 171).
; PLAN: r0=58(x), r1=171(y), r2=39(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 171
LDI r2, 39
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
