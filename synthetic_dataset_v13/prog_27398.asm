; DESCRIPTION: Places a black 103x39 rectangle at position (299, 169).
; PLAN: r0=299(x), r1=169(y), r2=103(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 169
LDI r2, 103
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
