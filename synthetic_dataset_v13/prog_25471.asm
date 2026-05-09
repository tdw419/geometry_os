; DESCRIPTION: Places a yellow 120x27 rectangle at position (59, 215).
; PLAN: r0=59(x), r1=215(y), r2=120(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 215
LDI r2, 120
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
