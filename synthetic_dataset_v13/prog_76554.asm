; DESCRIPTION: Places a white 111x10 rectangle at position (191, 234).
; PLAN: r0=191(x), r1=234(y), r2=111(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 234
LDI r2, 111
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
