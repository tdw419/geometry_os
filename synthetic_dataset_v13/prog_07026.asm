; DESCRIPTION: Places a white 103x59 rectangle at position (364, 172).
; PLAN: r0=364(x), r1=172(y), r2=103(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 172
LDI r2, 103
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
