; DESCRIPTION: Places a yellow 59x68 rectangle at position (304, 103).
; PLAN: r0=304(x), r1=103(y), r2=59(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 103
LDI r2, 59
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
