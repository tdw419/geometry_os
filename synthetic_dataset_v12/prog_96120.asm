; DESCRIPTION: Places a white 111x101 rectangle at position (245, 124).
; PLAN: r0=245(x), r1=124(y), r2=111(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 124
LDI r2, 111
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
