; DESCRIPTION: Places a blue 44x27 rectangle at position (304, 103).
; PLAN: r0=304(x), r1=103(y), r2=44(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 103
LDI r2, 44
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
