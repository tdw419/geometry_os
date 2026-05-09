; DESCRIPTION: Places a white 28x23 rectangle at position (394, 138).
; PLAN: r0=394(x), r1=138(y), r2=28(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 138
LDI r2, 28
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
