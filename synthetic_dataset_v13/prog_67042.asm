; DESCRIPTION: Places a yellow 86x56 rectangle at position (294, 103).
; PLAN: r0=294(x), r1=103(y), r2=86(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 103
LDI r2, 86
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
