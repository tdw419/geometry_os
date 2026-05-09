; DESCRIPTION: Places a blue 27x59 rectangle at position (380, 59).
; PLAN: r0=380(x), r1=59(y), r2=27(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 59
LDI r2, 27
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
