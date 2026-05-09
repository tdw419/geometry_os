; DESCRIPTION: Places a yellow 48x53 rectangle at position (182, 157).
; PLAN: r0=182(x), r1=157(y), r2=48(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 157
LDI r2, 48
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
