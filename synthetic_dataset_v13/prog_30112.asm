; DESCRIPTION: Places a yellow 73x67 rectangle at position (281, 50).
; PLAN: r0=281(x), r1=50(y), r2=73(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 50
LDI r2, 73
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
