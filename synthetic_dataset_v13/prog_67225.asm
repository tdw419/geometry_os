; DESCRIPTION: Places a white 12x86 rectangle at position (499, 113).
; PLAN: r0=499(x), r1=113(y), r2=12(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 113
LDI r2, 12
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
