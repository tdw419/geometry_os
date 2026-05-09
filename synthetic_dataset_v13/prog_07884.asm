; DESCRIPTION: Places a yellow 47x95 rectangle at position (304, 108).
; PLAN: r0=304(x), r1=108(y), r2=47(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 108
LDI r2, 47
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
