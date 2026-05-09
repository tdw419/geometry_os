; DESCRIPTION: Places a red 27x10 rectangle at position (412, 239).
; PLAN: r0=412(x), r1=239(y), r2=27(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 239
LDI r2, 27
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
