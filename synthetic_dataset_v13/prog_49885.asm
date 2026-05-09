; DESCRIPTION: Places a red 48x59 rectangle at position (396, 175).
; PLAN: r0=396(x), r1=175(y), r2=48(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 175
LDI r2, 48
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
