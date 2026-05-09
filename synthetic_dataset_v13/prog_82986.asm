; DESCRIPTION: Places a red 111x67 rectangle at position (385, 68).
; PLAN: r0=385(x), r1=68(y), r2=111(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 68
LDI r2, 111
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
