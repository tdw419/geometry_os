; DESCRIPTION: Places a orange 27x111 rectangle at position (204, 138).
; PLAN: r0=204(x), r1=138(y), r2=27(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 138
LDI r2, 27
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
